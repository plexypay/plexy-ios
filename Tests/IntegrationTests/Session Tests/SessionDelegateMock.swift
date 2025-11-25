//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
@_spi(PlexyInternal) import PlexyActions
import PlexyComponents
import PlexyDropIn
import PlexySession

class SessionDelegateMock: PlexySessionDelegate {
    
    var handlerMock: SessionAdvancedHandlerMock?
    var onDidComplete: ((PlexySessionResult, Component, PlexySession) -> Void)?
    var onDidFail: ((Error, Component, PlexySession) -> Void)?
    var onDidOpenExternalApplication: (() -> Void)?
    
    func didComplete(with result: PlexySessionResult, component: Component, session: PlexySession) {
        onDidComplete?(result, component, session)
    }
    
    func didFail(with error: Error, from component: Component, session: PlexySession) {
        onDidFail?(error, component, session)
    }
    
    func didOpenExternalApplication(component: ActionComponent, session: PlexySession) {
        onDidOpenExternalApplication?()
    }
    
    func handlerForPayments(in component: PaymentComponent, session: PlexySession) -> PlexySessionPaymentsHandler? {
        handlerMock
    }
    
    func handlerForAdditionalDetails(in component: ActionComponent, session: PlexySession) -> PlexySessionPaymentDetailsHandler? {
        handlerMock
    }
}

class SessionAdvancedHandlerMock: PlexySessionPaymentsHandler, PlexySessionPaymentDetailsHandler {
    
    var onDidSubmit: ((PaymentComponentData, Component, PlexySession) -> Void)?
    var onDidProvide: ((ActionComponentData, Component, PlexySession) -> Void)?
    
    func didSubmit(
        _ paymentComponentData: PaymentComponentData,
        from component: Component,
        dropInComponent: AnyDropInComponent?,
        session: PlexySession
    ) {
        onDidSubmit?(paymentComponentData, component, session)
    }
    
    func didProvide(_ actionComponentData: ActionComponentData, from component: ActionComponent, session: PlexySession) {
        onDidProvide?(actionComponentData, component, session)
    }
}
