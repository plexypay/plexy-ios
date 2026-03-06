//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Builds a certain `PaymentComponent` based on the concrete `PaymentMethod`.
@_spi(PlexyInternal)
public protocol PaymentComponentBuilder: PlexyContextAware {
    
    /// Builds a certain `PaymentComponent` based on a `StoredCardPaymentMethod`.
    func build(paymentMethod: StoredCardPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `StoredPaymentMethod`.
    func build(paymentMethod: StoredPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `StoredBCMCPaymentMethod`.
    func build(paymentMethod: StoredBCMCPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `StoredACHDirectDebitPaymentMethod`.
    func build(paymentMethod: StoredACHDirectDebitPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `CardPaymentMethod`.
    func build(paymentMethod: CardPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `BCMCPaymentMethod`.
    func build(paymentMethod: BCMCPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `IssuerListPaymentMethod`.
    func build(paymentMethod: IssuerListPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `SEPADirectDebitPaymentMethod`.
    func build(paymentMethod: SEPADirectDebitPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `BACSDirectDebitPaymentMethod`.
    func build(paymentMethod: BACSDirectDebitPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `ACHDirectDebitPaymentMethod`.
    func build(paymentMethod: ACHDirectDebitPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `ApplePayPaymentMethod`.
    func build(paymentMethod: ApplePayPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `WeChatPayPaymentMethod`.
    func build(paymentMethod: WeChatPayPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `QiwiWalletPaymentMethod`.
    func build(paymentMethod: QiwiWalletPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `MBWayPaymentMethod`.
    func build(paymentMethod: MBWayPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `BLIKPaymentMethod`.
    func build(paymentMethod: BLIKPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `DokuWalletPaymentMethod`.
    func build(paymentMethod: DokuPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `EContextPaymentMethod`.
    func build(paymentMethod: EContextPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `GiftCardPaymentMethod`.
    func build(paymentMethod: GiftCardPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `MealVoucherPaymentMethod`.
    func build(paymentMethod: MealVoucherPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `BoletoPaymentMethod`.
    func build(paymentMethod: BoletoPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `AffirmPaymentMethod`.
    func build(paymentMethod: AffirmPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `AtomePaymentMethod`.
    func build(paymentMethod: AtomePaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on  `OnlineBankingPaymentMethod`
    func build(paymentMethod: OnlineBankingPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `UPIPaymentMethod`.
    func build(paymentMethod: UPIPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `PayToPaymentMethod`.
    func build(paymentMethod: PayToPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `StoredPayToPaymentMethod`.
    func build(paymentMethod: StoredPayToPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `CashAppPayPaymentMethod`.
    func build(paymentMethod: CashAppPayPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `StoredCashAppPayPaymentMethod`.
    func build(paymentMethod: StoredCashAppPayPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `TwintPaymentMethod`.
    func build(paymentMethod: TwintPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on a `StoredTwintPaymentMethod`.
    func build(paymentMethod: StoredTwintPaymentMethod) -> (any PaymentComponent)?
    
    /// Builds a certain `PaymentComponent` based on a `PayByBankUSPaymentMethod`.
    func build(paymentMethod: PayByBankUSPaymentMethod) -> (any PaymentComponent)?

    /// Builds a certain `PaymentComponent` based on any `PaymentMethod`, as a default case.
    func build(paymentMethod: PaymentMethod) -> (any PaymentComponent)?
    
}
