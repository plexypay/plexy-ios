//
// Copyright (c) 2022 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
#if canImport(PlexyActions)
    @_spi(PlexyInternal) import PlexyActions
#endif
import PlexyNetworking
import Foundation

/// Describes the methods a delegate of ``PlexySession`` needs to implement.
public protocol PlexySessionDelegate: AnyObject {
    
    /// Invoked when the component finishes without any further steps needed by the application.
    /// The application only needs to dismiss the component.
    ///
    /// - Parameters:
    ///   - result: The result object of the completed payment.
    ///   - component: The component object.
    ///   - session: The session object.
    func didComplete(with result: PlexySessionResult, component: Component, session: PlexySession)
    
    /// Invoked when a payment component fails.
    ///
    /// - Parameters:
    ///   - error: The error that occurred.
    ///   - component: The component that failed.
    ///   - session: The session object.
    func didFail(with error: Error, from component: Component, session: PlexySession)
    
    /// Invoked when the action component opens a third party application outside the scope of the Plexy checkout,
    /// e.g WeChat Pay Application.
    /// In which case you can, for example, stop any loading animations.
    ///
    /// - Parameters:
    ///   - component: The current component object.
    ///   - session: The session object.
    func didOpenExternalApplication(component: ActionComponent, session: PlexySession)
    
    /// Returns a handler for handling the payment data submitted by the shopper that is required for the payments call.
    /// This method is optional.
    /// - Parameters:
    ///   - component: The current payment component object.
    ///   - session: The session object.
    /// - Returns: An instance conforming to the ``PlexySessionPaymentsHandler``
    /// protocol to take over, or nil to let ``PlexySession`` handle the flow.
    func handlerForPayments(in component: PaymentComponent, session: PlexySession) -> PlexySessionPaymentsHandler?
    
    /// Returns a handler for handling the additional data provided that is required for the payment details call.
    /// This method is optional.
    /// - Parameters:
    ///   - component: The current action component object.
    ///   - session: The session object.
    /// - Returns: An instance conforming to the ``PlexySessionPaymentDetailsHandler``
    /// protocol to take over, or nil to let ``PlexySession`` handle the flow.
    func handlerForAdditionalDetails(in component: ActionComponent, session: PlexySession) -> PlexySessionPaymentDetailsHandler?
}

/// Provides default empty implementation for ``PlexySessionDelegate``
public extension PlexySessionDelegate {

    func handlerForPayments(in component: PaymentComponent, session: PlexySession) -> PlexySessionPaymentsHandler? { nil }
    
    func handlerForAdditionalDetails(in component: ActionComponent, session: PlexySession) -> PlexySessionPaymentDetailsHandler? { nil }
    
    func didOpenExternalApplication(component: ActionComponent, session: PlexySession) {}
}

/// Describes the interface to take over the step where data is provided for the payments call.
public protocol PlexySessionPaymentsHandler {
    
    /// Invoked when the shopper submits the data needed for the payments call.
    ///
    /// - Parameters:
    ///   - paymentComponentData: The data supplied by the payment component.
    ///   - component: The payment component from which the payment details were submitted.
    ///   - dropInComponent: The DropIn Component instance if any.
    ///   - session: The ``PlexySession`` instance.
    func didSubmit(
        _ paymentComponentData: PaymentComponentData,
        from component: Component,
        dropInComponent: AnyDropInComponent?,
        session: PlexySession
    )
}

/// Describes the interface to take over the step where additional data is provided for making the payment details call.
public protocol PlexySessionPaymentDetailsHandler {
    
    /// Invoked when there is new data provided that is required for the payment details call.
    ///
    /// - Parameters:
    ///   - actionComponentData: The data supplied by the action component.
    ///   - component: The component that handled the action.
    func didProvide(_ actionComponentData: ActionComponentData, from component: ActionComponent, session: PlexySession)
}

/// Represents the status of a payment via ``PlexySession``.
public enum SessionPaymentResultCode: String {
    /// Indicates the payment was successfully authorised.
    case authorised = "Authorised"
    
    /// Indicates the payment was refused.
    case refused = "Refused"
    
    /// Indicates that it is not possible to obtain the final status of the payment.
    case pending = "Pending"
    
    /// Indicates the payment has been cancelled
    /// (either by the shopper or the merchant) before processing was completed.
    case cancelled = "Cancelled"
    
    /// There was an error when the payment was being processed.
    case error = "Error"
    
    /// Indicates the payment has successfully been received by Plexy, and will be processed.
    case received = "Received"
    
    /// Indicates that the response contains additional information that is presented to the shopper.
    case presentToShopper = "PresentToShopper"
    
    // Internal init to map payment response to only the final codes.
    internal init(paymentResultCode: PaymentsResponse.ResultCode) {
        switch paymentResultCode {
        case .authenticationFinished,
             .authenticationNotRequired,
             .redirectShopper,
             .identifyShopper,
             .challengeShopper:
            self = .error
        case .presentToShopper:
            self = .presentToShopper
        case .authorised:
            self = .authorised
        case .refused:
            self = .refused
        case .pending:
            self = .pending
        case .cancelled:
            self = .cancelled
        case .error:
            self = .error
        case .received:
            self = .received
        }
    }
}
