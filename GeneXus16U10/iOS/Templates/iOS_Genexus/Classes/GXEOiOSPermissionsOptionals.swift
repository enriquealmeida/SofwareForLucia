//
//  GXEOiOSPermissionsOptionals.swift
//  $Main.Name$
//

import GXCoreBL
import GXCoreUI
$if(Main.IOSUsageDescriptionMap.NSLocationWhenInUseUsageDescription ||
	(!Main.AppleDevice_tvOS &&
		(Main.IOSUsageDescriptionMap.NSLocationAlwaysAndWhenInUseUsageDescription || Main.IOSUsageDescriptionMap.NSLocationAlwaysUsageDescription)
	)
)$

extension GXEOiOSPermissions: GXEOiOSPermissionsLocationOptionals {
$if(Main.IOSUsageDescriptionMap.NSLocationWhenInUseUsageDescription)$
	
	@objc(gxRequestWhenInUseAuthorization)
	public static func gxRequestWhenInUseAuthorization() {
		if CLLocationManager.authorizationStatus() == .notDetermined {
			GXLocationManagerPermissionsHelper.sharedInstace.requestAuhtorization(withMode: .whenInUse)
		}
	}
$endif$
$if(!Main.AppleDevice_tvOS && (Main.IOSUsageDescriptionMap.NSLocationAlwaysAndWhenInUseUsageDescription || Main.IOSUsageDescriptionMap.NSLocationAlwaysUsageDescription))$
	
	@objc(gxRequestAlwaysAuthorization)
	public static func gxRequestAlwaysAuthorization() {
		if CLLocationManager.authorizationStatus() == .notDetermined {
			GXLocationManagerPermissionsHelper.sharedInstace.requestAuhtorization(withMode: .always)
		}
	}
$endif$
}

private class GXLocationManagerPermissionsHelper : NSObject, CLLocationManagerDelegate {
	fileprivate enum LocationAuthorizationMode {
		case always
		case whenInUse
	}
	
	public static let sharedInstace: GXLocationManagerPermissionsHelper = GXLocationManagerPermissionsHelper.init()
	
	fileprivate var locationManager: CLLocationManager?
	fileprivate var lastAuthorizationRequestMode: LocationAuthorizationMode!
	fileprivate var didRecieveUserAnswer = false
	
	private override init() {
		super.init()
		
		NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActiveNotification), name: UIApplication.didBecomeActiveNotification, object: nil)
	}
	
	fileprivate func requestAuhtorization(withMode mode: LocationAuthorizationMode) {
		if self.locationManager == nil {
			self.locationManager = CLLocationManager()
		}
		self.lastAuthorizationRequestMode = mode
		self.locationManager?.delegate = self
		
		switch mode {
			case .always:
				#if !os(tvOS)
				self.locationManager?.requestAlwaysAuthorization()
				#endif
			case .whenInUse:
				self.locationManager?.requestWhenInUseAuthorization()
			}
	}
	
	@objc fileprivate func applicationDidBecomeActiveNotification() {
		if (!self.didRecieveUserAnswer && CLLocationManager.authorizationStatus() == .notDetermined) {
			self.requestAuhtorization(withMode: self.lastAuthorizationRequestMode)
		}
	}
	
	// MARK: - CLLocationManagerDelegate
	
	public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if (status != .notDetermined && !self.didRecieveUserAnswer) {
			NotificationCenter.default.removeObserver(self)
			self.locationManager = nil
			self.didRecieveUserAnswer = true
		}
	}
}
$endif$
$if(Main.AppleDevice_iOS && Main.IOSUsageDescriptionMap.NSCameraUsageDescription)$

extension GXEOiOSPermissions: GXEOiOSPermissionsCameraOptionals {
	@objc(captureDeviceFromInput:)
	public static func captureDevice(from input: AVCaptureInput) -> AVCaptureDevice? {
		return (input as? AVCaptureDeviceInput)?.device
	}
	
	@objc(newCaptureDeviceInputWithDevice:)
	public static func newCaptureDeviceInput(with device: AVCaptureDevice) -> AVCaptureInput? {
		var input: AVCaptureDeviceInput? = nil
		do {
			input = try AVCaptureDeviceInput(device: device)
		}
		catch {
			GXFoundationServices.loggerService()?.logMessage(error.localizedDescription,
															 for: .general,
															 with: .error,
															 logToConsole: true)
		}
		return input
	}
}
$endif$
