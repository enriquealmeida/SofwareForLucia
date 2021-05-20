//
//  GXActionExObjMLKitHandler.swift
//
//  Copyright © 2020 GeneXus. All rights reserved.
//

@objc public class GXActionExObjMLKitHandler: GXActionExternalObjectHandler {

	// MARK: - Overrides

	public override static func handleActionExecutionUsingMethodHandlerSelectorNamePrefix() -> Bool {
		return true
	}

	// MARK: - Action Handlers

	@objc public func gxActionExObjMethodHandler_DetectFaces(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.detectFaces("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_DetectObjects(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.detectObjects("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_LabelImages(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.labelImages("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_RecognizeLandmarks(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.recognizeLandmarks("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_RecognizeText(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.recognizeText("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_IdentifyLanguage(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.identifyLanguage("", "", ""))
		onFinishedExecutingWithSuccess()
	}

	@objc public func gxActionExObjMethodHandler_TranslateText(_ parameters: [Any]) {
		setReturnValue(GXEOMLKit.translateText("", "", "", "", ""))
		onFinishedExecutingWithSuccess()
	}
}
