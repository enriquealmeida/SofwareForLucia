package com.artech.common

import com.artech.base.services.IExtensions

class ExtensionsManager : IExtensions {
    override val externalLoginManager = ExternalLoginManager()
}
