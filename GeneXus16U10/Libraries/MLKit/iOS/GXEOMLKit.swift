//
//  GXEOMLKit.swift
//
//  Copyright © 2020 GeneXus. All rights reserved.
//

import GXFoundation
import GXObjectsModel
import GXStandardClasses
import GXCoreBL

@objc(GXEOMLKit)
public class GXEOMLKit: GXExternalObjectBase {
	
	override public var externalObjectName: String {
		return "GeneXusAI.zProvider.MLK.Core.Definition.MLKit";
	}

    @objc public static func detectFaces(_ imageLocation: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtDetectFaces {
		let result = genexusai_zprovider_mlk_core_definition_SdtDetectFaces()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func detectObjects(_ imageLocation: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtDetectObjects {
		let result = genexusai_zprovider_mlk_core_definition_SdtDetectObjects()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func labelImages(_ imageLocation: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtLabelImages {
		let result = genexusai_zprovider_mlk_core_definition_SdtLabelImages()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func recognizeLandmarks(_ imageLocation: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtRecognizeLandmarks {
		let result = genexusai_zprovider_mlk_core_definition_SdtRecognizeLandmarks()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func recognizeText(_ imageLocation: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtRecognizeText {
		let result = genexusai_zprovider_mlk_core_definition_SdtRecognizeText()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func identifyLanguage(_ text: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtIdentifyLanguage {
		let result = genexusai_zprovider_mlk_core_definition_SdtIdentifyLanguage()
		result.fromJSONString(errorJson())
		return result
	}

	@objc public static func translateText(_ text: String, _ from: String, _ to: String, _ appId: String, _ appKey: String) -> genexusai_zprovider_mlk_core_definition_SdtTranslateText {
		let result = genexusai_zprovider_mlk_core_definition_SdtTranslateText()
		result.fromJSONString(errorJson())
		return result
    }
	
	private static func errorJson() -> String {
		return """
{
	\"result\":[],
	\"error\":{
		\"status\":\"\",
		\"message\":\"Task '%1' is unavailable for '%2' provider\",
		\"code\":\"GXAI6001\",
		\"errors\":[]
	}
}
"""
	}
}
