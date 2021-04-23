//
//  LottieActivityIndicatorViewProvider.swift
//

import Foundation
import GXCoreUI

@objc(LottieActivityIndicatorViewProvider)
public class LottieActivityIndicatorViewProvider: NSObject, GXActivityIndicatorViewProviderProtocol {

	internal static let lottieTypeIdenfifier = "idLottie"

	internal struct ExtensionProperties {
		static let lottieFile = "idLottieFile"
//		static let width = "width"
//		static let height = "height"

		static let all = [lottieFile/*, width, height*/]
	}

	public func activityIndicatorView() -> GXActivityIndicatorView {
        return LottieActivityIndicatorView()
    }

	public var animationThemeClassExtensionProperties: [String] {
		return ExtensionProperties.all
	}
}
