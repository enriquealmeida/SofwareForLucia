//
//  GXEOMLKitExtensionLibrary.swift
//
//  Copyright © 2020 GeneXus. All rights reserved.
//

import Foundation
import GXCoreBL

@objc(GXEOMLKitExtensionLibrary)
class GXEOMLKitExtensionLibrary: NSObject, GXExtensionLibraryProtocol {
	func initializeExtensionLibrary(withContext context: GXExtensionLibraryContext) {
		GXActionExternalObjectHandler.register(GXActionExObjMLKitHandler.self,
											   forExternalObjectName: "GeneXusAI.zProvider.MLK.Core.Definition.MLKit")
	}
}
