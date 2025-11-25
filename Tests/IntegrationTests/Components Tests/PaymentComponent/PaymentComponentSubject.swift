//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Plexy
import Foundation

class PaymentComponentSubject: PaymentComponent {

    // MARK: - Properties

    var context: PlexyContext
    var delegate: PaymentComponentDelegate?
    var payment: Payment?
    var order: PartialPaymentOrder?
    var paymentMethod: PaymentMethod

    // MARK: - Initializers

    public init(
        context: PlexyContext,
        delegate: PaymentComponentDelegate,
        payment: Payment?,
        order: PartialPaymentOrder?,
        paymentMethod: PaymentMethod
    ) {
        self.context = context
        self.delegate = delegate
        self.payment = payment
        self.order = order
        self.paymentMethod = paymentMethod
        self.payment = payment
    }
}
