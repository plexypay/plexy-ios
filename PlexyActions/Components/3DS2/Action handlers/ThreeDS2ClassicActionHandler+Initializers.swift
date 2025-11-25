//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Plexy3DS2
import Foundation
#if canImport(PlexyAuthentication)
    import PlexyAuthentication
#endif

extension ThreeDS2ClassicActionHandler {
    
    /// Initializes the 3D Secure 2 action handler.
    internal convenience init(
        context: PlexyContext,
        service: ThreeDSService,
        appearanceConfiguration: ADYAppearanceConfiguration,
        delegatedAuthenticationConfiguration: ThreeDS2Component.Configuration.DelegatedAuthentication?
    ) {
        let defaultHandler = createDefaultThreeDS2CoreActionHandler(
            context: context,
            service: service,
            appearanceConfiguration: appearanceConfiguration,
            delegatedAuthenticationConfiguration: delegatedAuthenticationConfiguration
        )
        self.init(
            context: context,
            appearanceConfiguration: appearanceConfiguration,
            service: service,
            coreActionHandler: defaultHandler,
            delegatedAuthenticationConfiguration: delegatedAuthenticationConfiguration
        )
    }
}
