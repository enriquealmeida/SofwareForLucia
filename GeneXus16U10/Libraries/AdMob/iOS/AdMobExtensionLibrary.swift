//
//  AdMobExtensionLibrary.swift
//

import GXCoreBL
import GXUCMobFox
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
import GoogleMobileAds
$endif$

@objc(AdMobExtensionLibrary)
public class AdMobExtensionLibrary: NSObject, GXExtensionLibraryProtocol {

	public func initializeExtensionLibrary(withContext context: GXExtensionLibraryContext) {
		GXUCSDAdsViewProviders.registerProvider(GXAdMobAdsViewProvider.self, forName: "admob")
$if(Main.Dynamic.GXEmptyFilter.AdMob_AppID)$
		GADMobileAds.sharedInstance().start(completionHandler: nil)
$else$
		GXFoundationServices.loggerService()?.logMessage("AdMob Application Id Missing", for: .general, with: .error, logToConsole: true)
$endif$
    }
}
