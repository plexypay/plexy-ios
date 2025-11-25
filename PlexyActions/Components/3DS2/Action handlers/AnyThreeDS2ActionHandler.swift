//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Plexy3DS2
import Foundation

internal protocol AnyThreeDS2ActionHandler {

    func handle(
        _ fingerprintAction: ThreeDS2FingerprintAction,
        completionHandler: @escaping (Result<ThreeDSActionHandlerResult, Error>) -> Void
    )

    func handle(
        _ challengeAction: ThreeDS2ChallengeAction,
        completionHandler: @escaping (Result<ThreeDSActionHandlerResult, Error>) -> Void
    )
    
    var threeDSRequestorAppURL: URL? { get set }
    
    var presentationDelegate: PresentationDelegate? { get set }
}

internal protocol ComponentWrapper: Component {

    var wrappedComponent: Component { get }
    
}

extension ComponentWrapper {

    internal var apiContext: APIContext { wrappedComponent.context.apiContext }

    internal var context: PlexyContext { wrappedComponent.context }

    internal var _isDropIn: Bool { // swiftlint:disable:this identifier_name
        get {
            wrappedComponent._isDropIn
        }

        set {
            wrappedComponent._isDropIn = newValue
        }
    }
}

internal func createDefaultThreeDS2CoreActionHandler(
    context: PlexyContext,
    service: ThreeDSService,
    appearanceConfiguration: ADYAppearanceConfiguration,
    delegatedAuthenticationConfiguration: ThreeDS2Component.Configuration.DelegatedAuthentication?
) -> AnyThreeDS2CoreActionHandler {
    #if canImport(PlexyAuthentication)
        if #available(iOS 16.0, *), let delegatedAuthenticationConfiguration {
            return ThreeDS2PlusDACoreActionHandler(
                context: context,
                service: service,
                appearanceConfiguration: appearanceConfiguration,
                delegatedAuthenticationConfiguration: delegatedAuthenticationConfiguration
            )
        } else {
            return ThreeDS2CoreActionHandler(
                context: context,
                service: service,
                appearanceConfiguration: appearanceConfiguration
            )
        }
    #else
        return ThreeDS2CoreActionHandler(
            context: context,
            service: service,
            appearanceConfiguration: appearanceConfiguration
        )
    #endif
}
