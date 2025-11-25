//
// Copyright (c) 2017 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import TwintSDK

/// A component that handles a Twint payment.
public final class TwintComponent: PaymentComponent {

    /// Configuration for Twint Component.
    public typealias Configuration = BasicComponentConfiguration

    /// The context object for this component.
    @_spi(PlexyInternal)
    public let context: PlexyContext

    /// The payment method object for this component.
    public let paymentMethod: PaymentMethod

    /// The ready to submit payment data.
    public var paymentData: PaymentComponentData {
        let details = TwintDetails(
            type: paymentMethod,
            subType: "sdk"
        )

        return PaymentComponentData(
            paymentMethodDetails: details,
            amount: context.payment?.amount,
            order: nil,
            storePaymentMethod: nil
        )
    }

    /// Component's configuration
    public var configuration: Configuration

    /// The delegate of the component.
    public weak var delegate: PaymentComponentDelegate?

    // MARK: - Initializers

    /// Initializes the Twint component.
    ///
    /// - Parameter paymentMethod: The Twint  payment method.
    /// - Parameter context: The context object for this component.
    /// - Parameter configuration: The configuration for the component.
    public init(
        paymentMethod: TwintPaymentMethod,
        context: PlexyContext,
        configuration: Configuration = .init()
    ) {
        self.paymentMethod = paymentMethod
        self.context = context
        self.configuration = configuration
    }

    // MARK: - PaymentInitiable

    /// Generate the payment details and invoke PaymentsComponentDelegate method.
    public func initiatePayment() {
        submit(data: paymentData)
    }
}

@_spi(PlexyInternal)
extension TwintComponent: PaymentInitiable {}

@_spi(PlexyInternal)
extension TwintComponent: TrackableComponent {}
