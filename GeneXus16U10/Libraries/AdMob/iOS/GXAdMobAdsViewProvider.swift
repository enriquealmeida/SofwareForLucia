//
//  GXAdMobAdsViewProvider.swift
//

import GXCoreUI
import GXUCMobFox
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
import GoogleMobileAds
$endif$

internal class GXAdMobAdsViewProvider: NSObject, GXUCSDAdsViewProvider {
	
	public required init(layoutElement: GXLayoutElementUserControl) {
		self.layoutElement = layoutElement
		let properties = layoutElement.layoutElementUserControlCustomProperties
		adUnitId = properties.getPropertyValueString("@SDAdsViewAdUnitId") ?? ""
	}
	
	private let layoutElement: GXLayoutElementUserControl
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
	private var bannerView: GADBannerView? = nil
$else$
	private var bannerView: UILabel? = nil
$endif$

	public var adUnitId: String
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
	{
		didSet {
			if oldValue != adUnitId {
				if let adsView = loadedAdsView {
					let newdAdUnitIDValue: String? = adUnitId.isEmpty ? nil : adUnitId
					if bannerView == adsView {
						bannerView!.adUnitID = newdAdUnitIDValue
					}
				}
			}
		}
	}
$endif$
	
	// MARK: GXUCSDAdsViewProvider
	
	static func newAdsViewProvider(with layoutElement: GXLayoutElementUserControl) -> GXUCSDAdsViewProvider {
		return GXAdMobAdsViewProvider(layoutElement: layoutElement)
	}
	
	public weak var delegate: GXUCSDAdsViewProviderDelegate? = nil
	
	public var loadedAdsView: UIView? { return bannerView }
	
	public func adsView(withFrame frame: CGRect) -> UIView {
		if let adsView = loadedAdsView {
			adsView.frame = frame
			return adsView
		}
		
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
		let adSize = GXExecutionEnvironmentHelper.interfaceOrientation.isLandscape ? kGADAdSizeSmartBannerLandscape : kGADAdSizeSmartBannerPortrait
		let bannerView = GADBannerView(adSize: adSize, origin: frame.origin)
		bannerView.delegate = self
		bannerView.adUnitID = adUnitId.isEmpty ? nil : adUnitId
		bannerView.rootViewController = delegate?.adsViewProviderContainerViewController(self)
$else$
		let bannerView = UILabel(frame: frame)
		bannerView.adjustsFontSizeToFitWidth = true
		bannerView.textAlignment = .center
		bannerView.text = "AdMob Application Id Missing"
$endif$
		self.bannerView = bannerView
		requestAd()
		return bannerView
	}
	
	public func setLoadedAdsViewFrame(_ frame: CGRect) {
		self.loadedAdsView?.frame = frame
	}
	
	public func requestAd() {
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
		guard loadedAdsView != nil && !adUnitId.isEmpty else { return }

		let request = GADRequest();
		bannerView?.load(request)
$endif$
	}
	
	public func value(forPropertyName propertyName: String) -> Any? {
		switch propertyName {
		case "adunitid":
			return adUnitId
		default:
			return nil
		}
	}
	
	public func applyPropertyValue(_ propValue: Any?, toPropertyName propName: String) -> Bool {
		switch propName {
		case "adunitid":
			adUnitId = GXUtilities.string(from: propValue) ?? ""
			return true
		default:
			return false
		}
	}
}

$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
extension GXAdMobAdsViewProvider: GADBannerViewDelegate {
	
	public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
		guard bannerView == self.bannerView else {
			return
		}
		
		delegate?.adsViewProviderDidReceiveAd?(self)
	}
	
	public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
		guard bannerView == self.bannerView else {
			return
		}
		
		delegate?.adsViewProvider?(self, didFailToReceiveAdWithError: error)
	}
}
$endif$
