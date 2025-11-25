//
// Copyright (c) 2022 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy

/// Contains the details supplied by the Online Banking component.
public struct OnlineBankingDetails: PaymentMethodDetails {
    
    @_spi(PlexyInternal)
    public var checkoutAttemptId: String?

    /// The payment method type.
    public let type: PaymentMethodType

    ///  Selected issuer
    public let issuer: String

    /// Initializes the Online Banking details.
    /// - Parameters:
    ///   - paymentMethod: Online Banking payment method.
    ///   - issuerName: The issuer's identifier.
    public init(
        paymentMethod: PaymentMethod,
        issuer: String
    ) {
        self.type = paymentMethod.type
        self.issuer = issuer
    }

}
