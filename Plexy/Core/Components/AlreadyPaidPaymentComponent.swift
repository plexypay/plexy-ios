//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Provides a placeholder for payment methods that are already paid, just for display.
@_spi(PlexyInternal)
public final class AlreadyPaidPaymentComponent: PaymentComponent {

    /// The context object for this component.
    public let context: PlexyContext
    
    public let paymentMethod: PaymentMethod

    public weak var delegate: PaymentComponentDelegate?

    public init(
        paymentMethod: PaymentMethod,
        context: PlexyContext
    ) {
        self.paymentMethod = paymentMethod
        self.context = context
    }
    
}
