//
// Copyright (c) 2019 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
#if canImport(PlexyCard)
    @_spi(PlexyInternal) import PlexyCard
#endif
#if canImport(PlexyComponents)
    @_spi(PlexyInternal) import PlexyComponents
#endif
#if canImport(PlexyActions)
    @_spi(PlexyInternal) import PlexyActions
#endif
import Foundation

extension ComponentManager: PaymentComponentBuilder {

    internal func build(paymentMethod: StoredCardPaymentMethod) -> (any PaymentComponent)? {
        createCardComponent(with: paymentMethod)
    }

    internal func build(paymentMethod: StoredPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }

    internal func build(paymentMethod: StoredBCMCPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }

    internal func build(paymentMethod: StoredACHDirectDebitPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }

    internal func build(paymentMethod: CardPaymentMethod) -> (any PaymentComponent)? {
        createCardComponent(with: paymentMethod)
    }

    internal func build(paymentMethod: BCMCPaymentMethod) -> (any PaymentComponent)? {
        createBancontactComponent(with: paymentMethod)
    }

    internal func build(paymentMethod: IssuerListPaymentMethod) -> (any PaymentComponent)? {
        IssuerListComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(
                style: configuration.style.listComponent,
                localizationParameters: configuration.localizationParameters
            )
        )
    }

    internal func build(paymentMethod: SEPADirectDebitPaymentMethod) -> (any PaymentComponent)? {
        createSEPAComponent(paymentMethod)
    }

    internal func build(paymentMethod: BACSDirectDebitPaymentMethod) -> (any PaymentComponent)? {
        createBACSDirectDebit(paymentMethod)
    }

    internal func build(paymentMethod: ACHDirectDebitPaymentMethod) -> (any PaymentComponent)? {
        createACHDirectDebitComponent(paymentMethod)
    }

    internal func build(paymentMethod: ApplePayPaymentMethod) -> (any PaymentComponent)? {
        createPreApplePayComponent(with: paymentMethod)
    }

    internal func build(paymentMethod: QiwiWalletPaymentMethod) -> (any PaymentComponent)? {
        createQiwiWalletComponent(paymentMethod)
    }

    internal func build(paymentMethod: MBWayPaymentMethod) -> (any PaymentComponent)? {
        createMBWayComponent(paymentMethod)
    }

    internal func build(paymentMethod: BLIKPaymentMethod) -> (any PaymentComponent)? {
        createBLIKComponent(paymentMethod)
    }

    internal func build(paymentMethod: EContextPaymentMethod) -> (any PaymentComponent)? {
        let config = BasicPersonalInfoFormComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return BasicPersonalInfoFormComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    internal func build(paymentMethod: DokuPaymentMethod) -> (any PaymentComponent)? {
        let config = DokuComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    internal func build(paymentMethod: GiftCardPaymentMethod) -> (any PaymentComponent)? {
        guard let amount = context.payment?.amount, partialPaymentEnabled else { return nil }
        return GiftCardComponent(
            paymentMethod: paymentMethod,
            context: context,
            amount: amount,
            style: configuration.style.formComponent,
            showsSecurityCodeField: configuration.giftCard.showsSecurityCodeField
        )
    }

    internal func build(paymentMethod: MealVoucherPaymentMethod) -> (any PaymentComponent)? {
        guard let amount = context.payment?.amount, partialPaymentEnabled else { return nil }
        return GiftCardComponent(
            paymentMethod: paymentMethod,
            context: context,
            amount: amount,
            style: configuration.style.formComponent,
            showsSecurityCodeField: configuration.giftCard.showsSecurityCodeField
        )
    }

    internal func build(paymentMethod: BoletoPaymentMethod) -> (any PaymentComponent)? {
        createBoletoComponent(paymentMethod)
    }

    internal func build(paymentMethod: AffirmPaymentMethod) -> (any PaymentComponent)? {
        let config = AffirmComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return AffirmComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    internal func build(paymentMethod: PaymentMethod) -> (any PaymentComponent)? {
        InstantPaymentComponent(
            paymentMethod: paymentMethod,
            context: context,
            order: order
        )
    }

    internal func build(paymentMethod: AtomePaymentMethod) -> (any PaymentComponent)? {
        let config = AtomeComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return AtomeComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    internal func build(paymentMethod: OnlineBankingPaymentMethod) -> (any PaymentComponent)? {
        OnlineBankingComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(style: configuration.style.formComponent)
        )
    }

    internal func build(paymentMethod: UPIPaymentMethod) -> (any PaymentComponent)? {
        UPIComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(style: configuration.style.formComponent)
        )
    }

    internal func build(paymentMethod: PayByBankUSPaymentMethod) -> (any PaymentComponent)? {
        let configuration: PayByBankUSComponent.Configuration = .init()
        return PayByBankUSComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: configuration
        )
    }
    
    internal func build(paymentMethod: PayToPaymentMethod) -> (any PaymentComponent)? {
        PayToComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(style: configuration.style.formComponent)
        )
    }
    
    internal func build(paymentMethod: StoredPayToPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }

    internal func build(paymentMethod: WeChatPayPaymentMethod) -> (any PaymentComponent)? {
        InstantPaymentComponent(
            paymentMethod: paymentMethod,
            context: context,
            order: order
        )
    }

    internal func build(paymentMethod: CashAppPayPaymentMethod) -> (any PaymentComponent)? {
        InstantPaymentComponent(
            paymentMethod: paymentMethod,
            context: context,
            order: order
        )
    }

    internal func build(paymentMethod: StoredCashAppPayPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }

    internal func build(paymentMethod: TwintPaymentMethod) -> (any PaymentComponent)? {
        InstantPaymentComponent(
            paymentMethod: paymentMethod,
            context: context,
            order: order
        )
    }

    internal func build(paymentMethod: StoredTwintPaymentMethod) -> (any PaymentComponent)? {
        StoredPaymentMethodComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: .init(localizationParameters: configuration.localizationParameters)
        )
    }
}

// MARK: - Privates

private extension ComponentManager {
    
    func createCardComponent(with paymentMethod: AnyCardPaymentMethod) -> (any PaymentComponent)? {
        var cardConfiguration = configuration.card.cardComponentConfiguration
        cardConfiguration.style = configuration.style.formComponent
        cardConfiguration.localizationParameters = configuration.localizationParameters
        cardConfiguration.shopperInformation = configuration.shopperInformation
        return CardComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: cardConfiguration
        )
    }

    func createBancontactComponent(with paymentMethod: BCMCPaymentMethod) -> (any PaymentComponent)? {
        let cardConfiguration = configuration.card
        let configuration = CardComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters,
            showsHolderNameField: cardConfiguration.showsHolderNameField,
            showsStorePaymentMethodField: cardConfiguration.showsStorePaymentMethodField,
            showsSecurityCodeField: cardConfiguration.showsSecurityCodeField,
            storedCardConfiguration: cardConfiguration.stored
        )

        return BCMCComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: configuration
        )
    }

    func createPreApplePayComponent(with paymentMethod: ApplePayPaymentMethod) -> (any PaymentComponent)? {
        guard let applePay = configuration.applePay else {
            plexyPrint("Failed to instantiate ApplePayComponent because ApplePayConfiguration is missing")
            return nil
        }

        let preApplePayConfig = PreApplePayComponent.Configuration(
            style: configuration.style.applePay,
            localizationParameters: configuration.localizationParameters
        )

        if let amount = order?.remainingAmount {
            let configuration = applePay.replacing(amount: amount)
            if let component = try? PreApplePayComponent(
                paymentMethod: paymentMethod,
                context: context,
                configuration: preApplePayConfig,
                applePayConfiguration: configuration
            ) {
                return component
            }
        }

        do {
            return try PreApplePayComponent(
                paymentMethod: paymentMethod,
                context: context,
                configuration: preApplePayConfig,
                applePayConfiguration: applePay
            )
        } catch {
            plexyPrint("Failed to instantiate ApplePayComponent because of error: \(error.localizedDescription)")
            return nil
        }
    }

    func createSEPAComponent(_ paymentMethod: SEPADirectDebitPaymentMethod) -> SEPADirectDebitComponent {
        let config = SEPADirectDebitComponent.Configuration(
            style: configuration.style.formComponent,
            localizationParameters: configuration.localizationParameters
        )
        return SEPADirectDebitComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    func createBACSDirectDebit(_ paymentMethod: BACSDirectDebitPaymentMethod) -> BACSDirectDebitComponent {
        let bacsConfiguration = BACSDirectDebitComponent.Configuration(
            style: configuration.style.formComponent,
            localizationParameters: configuration.localizationParameters
        )
        let bacsDirectDebitComponent = BACSDirectDebitComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: bacsConfiguration
        )
        bacsDirectDebitComponent.presentationDelegate = presentationDelegate
        return bacsDirectDebitComponent
    }

    func createACHDirectDebitComponent(_ paymentMethod: ACHDirectDebitPaymentMethod) -> ACHDirectDebitComponent {
        let config = ACHDirectDebitComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters,
            showsStorePaymentMethodField: configuration.ach.showsStorePaymentMethodField,
            showsBillingAddress: configuration.ach.showsBillingAddress,
            billingAddressCountryCodes: configuration.ach.billingAddressCountryCodes
        )
        return ACHDirectDebitComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    func createQiwiWalletComponent(_ paymentMethod: QiwiWalletPaymentMethod) -> QiwiWalletComponent {
        let config = QiwiWalletComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return QiwiWalletComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    func createMBWayComponent(_ paymentMethod: MBWayPaymentMethod) -> MBWayComponent? {
        let config = MBWayComponent.Configuration(
            style: configuration.style.formComponent,
            shopperInformation: configuration.shopperInformation,
            localizationParameters: configuration.localizationParameters
        )
        return MBWayComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    func createBLIKComponent(_ paymentMethod: BLIKPaymentMethod) -> BLIKComponent? {
        let config = BLIKComponent.Configuration(
            style: configuration.style.formComponent,
            localizationParameters: configuration.localizationParameters
        )
        return BLIKComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }

    func createBoletoComponent(_ paymentMethod: BoletoPaymentMethod) -> BoletoComponent {
        let config = BoletoComponent.Configuration(
            style: configuration.style.formComponent,
            localizationParameters: configuration.localizationParameters,
            shopperInformation: configuration.shopperInformation,
            showEmailAddress: configuration.boleto.showEmailAddress
        )
        return BoletoComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
    }
}
