package com.artech.common

import com.artech.base.services.IExternalLoginManager
import com.artech.base.services.ILoginProvider

class ExternalLoginManager : IExternalLoginManager {
    val providerMap = HashMap<String, ILoginProvider>()

    override fun addProvider(provider: ILoginProvider) {
        providerMap.set(provider.name, provider)
    }

    override fun removeProvider(provider: ILoginProvider) {
        providerMap.remove(provider.name)
    }

    override fun getProvider(name: String): ILoginProvider? {
        return providerMap.get(name)
    }
}
