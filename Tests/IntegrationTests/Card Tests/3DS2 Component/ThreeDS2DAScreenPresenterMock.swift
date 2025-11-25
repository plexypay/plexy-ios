//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

#if canImport(PlexyAuthentication)
    @_spi(PlexyInternal) @testable import Plexy
    import Plexy3DS2
    @_spi(PlexyInternal) @testable import PlexyActions
    import PlexyAuthentication
    import Foundation
    import UIKit

    final class ThreeDS2DAScreenPresenterMock: ThreeDS2PlusDAScreenPresenterProtocol {
    
        func showDeletionConfirmation(component: any Plexy.Component, handler: @escaping VoidHandler) {
            handler()
        }
        
        func showAuthenticationError(
            component: any Plexy.Component,
            handler: @escaping VoidHandler,
            troubleshootingHandler: @escaping VoidHandler
        ) {
            handler()
        }
    
        func showRegistrationError(component: any Plexy.Component, handler: VoidHandler) {
            handler()
        }
    
        var presentationDelegate: (any Plexy.PresentationDelegate)?
    
        enum ShowRegistrationScreenMockState {
            case register
            case fallback
        }
    
        let showRegistrationReturnState: ShowRegistrationScreenMockState
        var onShowRegistrationScreen: ((
            (number: String?, type: Plexy.CardType?)
        ) -> Void)?

        func showRegistrationScreen(
            component: any Plexy.Component,
            cardDetails: (number: String?, type: Plexy.CardType?),
            registerDelegatedAuthenticationHandler: @escaping VoidHandler,
            fallbackHandler: @escaping VoidHandler
        ) {
            onShowRegistrationScreen?(cardDetails)
            switch showRegistrationReturnState {
            case .register:
                registerDelegatedAuthenticationHandler()
            case .fallback:
                fallbackHandler()
            }
        }
    
        enum ShowApprovalScreenMockState {
            case approve
            case fallback
            case removeCredentials
        }
    
        let showApprovalScreenReturnState: ShowApprovalScreenMockState
    
        var onShowApprovalScreen: ((
            (number: String?, type: Plexy.CardType?),
            Plexy.Amount?
        ) -> Void)?
        
        func showApprovalScreen(
            component: any Plexy.Component,
            cardDetails: (number: String?, type: Plexy.CardType?),
            amount: Plexy.Amount?,
            approveAuthenticationHandler: @escaping VoidHandler,
            fallbackHandler: @escaping VoidHandler,
            removeCredentialsHandler: @escaping VoidHandler
        ) {
            onShowApprovalScreen?(cardDetails, amount)
            switch showApprovalScreenReturnState {
            case .approve:
                approveAuthenticationHandler()
            case .fallback:
                fallbackHandler()
            case .removeCredentials:
                removeCredentialsHandler()
            }
        }
    
        init(
            showRegistrationReturnState: ShowRegistrationScreenMockState,
            showApprovalScreenReturnState: ShowApprovalScreenMockState
        ) {
            self.showRegistrationReturnState = showRegistrationReturnState
            self.showApprovalScreenReturnState = showApprovalScreenReturnState
        }
    }

#endif
