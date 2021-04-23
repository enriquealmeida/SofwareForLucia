package com.artech.common;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;

import org.apache.http.conn.scheme.*;
import org.apache.http.conn.ssl.*;
import org.apache.http.params.*;

import com.artech.base.services.Services;

@SuppressWarnings("deprecation")
public class TlsSniSocketFactory implements LayeredSocketFactory
{
	private static final String TAG = "SNISocketFactory";

	static final HostnameVerifier HOSTNAME_VERIFIER = new StrictHostnameVerifier();
	private X509HostnameVerifier hostPinningVerifier;

	// Plain TCP/IP (layer below TLS)

	@Override
	public Socket connectSocket(Socket s, String host, int port, InetAddress localAddress, int localPort, HttpParams params) throws IOException
	{
		return null;
	}

	@Override
	public Socket createSocket() throws IOException {
		return null;
	}

	@Override
	public boolean isSecure(Socket s) throws IllegalArgumentException {
		if (s instanceof SSLSocket)
			return ((SSLSocket)s).isConnected();
		return false;
	}


	// TLS layer
	@Override
	public Socket createSocket(Socket plainSocket, String host, int port, boolean autoClose) throws IOException, UnknownHostException
	{
		// we don't need the plainSocket
		if (autoClose) plainSocket.close();

		// create and connect SSL socket, but don't do hostname/certificate verification yet
		android.net.SSLCertificateSocketFactory sslSocketFactory = (android.net.SSLCertificateSocketFactory) android.net.SSLCertificateSocketFactory.getDefault(0);
		SSLSocket ssl = (SSLSocket)sslSocketFactory.createSocket(InetAddress.getByName(host), port);

		// enable TLSv1.1/1.2 if available
		// (see https://github.com/rfc2822/davdroid/issues/229)
		String[] supportedProtocols = ssl.getSupportedProtocols();
		ArrayList<String> tempList =  new ArrayList<String>();
		Collections.addAll(tempList, supportedProtocols);
		// remove only olds and unsecure protocols (SSLv3 ), TLS in all version are supported.
		tempList.remove("SSLv3");
		// from : https://blog.dev-area.net/2015/08/13/android-4-1-enable-tls-1-1-and-tls-1-2/
		//  add 1.1 and 1.2 if not yet added, at least in Android 4.x
		if (!tempList.contains("TLSv1.1"))
			tempList.add("TLSv1.1");
		if (!tempList.contains("TLSv1.2"))
			tempList.add("TLSv1.2");

		supportedProtocols = tempList.toArray(new String[tempList.size()]);
		ssl.setEnabledProtocols(supportedProtocols);

		// set up SNI before the handshake
		Services.Log.info(TAG, "Setting SNI hostname");
		sslSocketFactory.setHostname(ssl, host);

		// verify hostname and certificate
		SSLSession session = ssl.getSession();
		if (!HOSTNAME_VERIFIER.verify(host, session))
			throw new SSLPeerUnverifiedException("Cannot verify hostname: " + host);

		if (hostPinningVerifier!=null)
			hostPinningVerifier.verify(host, ssl);

		return ssl;
	}


	public void setHostnameVerifier(X509HostnameVerifier delegate)
	{
		hostPinningVerifier = delegate;
	}
}
