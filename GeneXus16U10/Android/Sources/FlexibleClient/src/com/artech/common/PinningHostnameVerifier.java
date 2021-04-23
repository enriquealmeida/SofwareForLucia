package com.artech.common;

import android.net.http.X509TrustManagerExtensions;
import android.util.Base64;

import org.apache.http.conn.scheme.*;
import org.apache.http.conn.ssl.*;
import org.apache.http.impl.client.*;

import com.artech.R;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;

import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.net.ssl.SSLException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

@SuppressWarnings("deprecation")
public class PinningHostnameVerifier implements org.apache.http.conn.ssl.X509HostnameVerifier
{
	// from https://medium.com/@appmattus/android-security-ssl-pinning-1db8acb6621e add
	// HostnameVerifier that use delegate verifier plus SSL pinning verifier.

	private final X509HostnameVerifier delegate;

	public PinningHostnameVerifier(X509HostnameVerifier delegate) {
		this.delegate = delegate;
	}

	public static void registerVerifier(DefaultHttpClient client)
	{
		SocketFactory socketFactory = client
				.getConnectionManager()
				.getSchemeRegistry()
				.getScheme("https")
				.getSocketFactory();

		if (socketFactory instanceof SSLSocketFactory) // default factory
		{
			SSLSocketFactory sslSocketFactory = (SSLSocketFactory)socketFactory;
			X509HostnameVerifier delegate = sslSocketFactory.getHostnameVerifier();
			X509HostnameVerifier pinningHostnameVerifier =	new PinningHostnameVerifier(delegate);
			sslSocketFactory.setHostnameVerifier(pinningHostnameVerifier);

		}
		else if (socketFactory instanceof TlsSniSocketFactory) // our custom factory for sni
		{
			TlsSniSocketFactory sniSocketFactory = (TlsSniSocketFactory) socketFactory;
			sniSocketFactory.setHostnameVerifier(new PinningHostnameVerifier(new StrictHostnameVerifier()));
		}

	}

	public static String[] getPinSet()
	{
		return MyApplication.getAppContext().getResources().getStringArray(R.array.serverPinSet);
	}

	@Override @SuppressWarnings("checkstyle:IllegalCatch")
	public void verify(String host, SSLSocket ssl) throws IOException {
		delegate.verify(host, ssl);
		try {
			if (!verify(host, ssl.getSession())) {
				throw new SSLPeerUnverifiedException("Certificate pinning failure");
			}
		}catch (RuntimeException e) {
			throw new IOException(e);
		}
	}

	@Override
	public boolean verify(String host, SSLSession sslSession)
	{
		if (delegate.verify(host, sslSession)) {
			try {
				Set<String> validPins = new HashSet<String>() ;
				for (String pinValue : PinningHostnameVerifier.getPinSet())
					validPins.add(pinValue);

				validatePinning(sslSession.getPeerCertificates(),
						host, validPins);
				return true;
			} catch (SSLException e) {
				throw new RuntimeException(e);
			}
		}

		return false;
	}

	@Override
	public void verify(String host, X509Certificate cert) throws SSLException {
		delegate.verify(host, cert);

	}

	@Override
	public void verify(String host, String[] cns, String[] subjectAlts) throws SSLException {
		delegate.verify(host, cns, subjectAlts);

	}

	private void validatePinning(Certificate[] serverCerts,
								 String host, Set<String> validPins)
			throws SSLException
	{
		String certChainMsg = "";
		X509TrustManagerExtensions trustManagerExt = getTrustManager();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			List<X509Certificate> trustedChain = trustedChain(trustManagerExt, serverCerts, host);

			for (X509Certificate cert : trustedChain) {
				byte[] publicKey = cert.getPublicKey().getEncoded();
				md.update(publicKey, 0, publicKey.length);
				String pin = Base64.encodeToString(md.digest(),
						Base64.NO_WRAP);
				certChainMsg += "    sha256/" + pin + " : " +
						cert.getSubjectDN().toString() + "\n";
				if (validPins.contains(pin)) {
					return;
				}
			}
		} catch (NoSuchAlgorithmException e) {
			throw new SSLException(e);
		}
		Services.Log.debug("Certificate pinning failure, Peer certificate chain:\n" + certChainMsg);
		throw new SSLPeerUnverifiedException("Certificate pinning failure" );
	}

	private List<X509Certificate> trustedChain(
			X509TrustManagerExtensions trustManagerExt,
			Certificate[] serverCerts,
			String host) throws SSLException
	{
		X509Certificate[] untrustedCerts = Arrays.copyOf(serverCerts,
				serverCerts.length, X509Certificate[].class);
				try {
			return trustManagerExt.checkServerTrusted(untrustedCerts,
					"RSA", host);
		} catch (CertificateException e) {
			throw new SSLException(e);
		}
	}

	private X509TrustManagerExtensions getTrustManager() throws SSLException
	{
		try {

			TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance( TrustManagerFactory.getDefaultAlgorithm());
			trustManagerFactory.init((KeyStore) null);

			// Find first X509TrustManager in the TrustManagerFactory
			X509TrustManager x509TrustManager = null;
			for (TrustManager trustManager : trustManagerFactory.getTrustManagers()) {
				if (trustManager instanceof X509TrustManager) {
					x509TrustManager = (X509TrustManager) trustManager;
					break;
				}
			}
			X509TrustManagerExtensions trustManagerExt =
					new X509TrustManagerExtensions(x509TrustManager);

			return trustManagerExt;

		} catch (NoSuchAlgorithmException e) {
			throw new SSLException(e);
		} catch (KeyStoreException e) {
			throw new SSLException(e);
		}
	}
}
