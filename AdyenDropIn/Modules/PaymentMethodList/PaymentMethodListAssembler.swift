//
// Copyright (c) 2025 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
#if canImport(AdyenCard)
    import AdyenCard
#endif
import Foundation

internal protocol PaymentMethodListAssemblerProtocol {
    func resolvePaymentMethodListRouter() -> PaymentMethodListRouterProtocol
}

internal struct PaymentMethodListAssembler: PaymentMethodListAssemblerProtocol {

    // MARK: - Properties

    private let componentManager: ComponentManager
    private let context: AdyenContext
    private let configuration: DropInComponent.Configuration
    private let componentDelegate: CheckoutComponentDelegate
    private let cardComponentDelegate: CardComponentDelegate?
    private let partialPaymentDelegate: PartialPaymentDelegate?

    // MARK: - Initializers

    internal init(
        componentManager: ComponentManager,
        context: AdyenContext,
        configuration: DropInComponent.Configuration,
        componentDelegate: CheckoutComponentDelegate,
        cardComponentDelegate: CardComponentDelegate?,
        partialPaymentDelegate: PartialPaymentDelegate?
    ) {
        self.componentManager = componentManager
        self.context = context
        self.configuration = configuration
        self.componentDelegate = componentDelegate
        self.cardComponentDelegate = cardComponentDelegate
        self.partialPaymentDelegate = partialPaymentDelegate
    }

    // MARK: - PaymentMethodListAssemblerProtocol

    internal func resolvePaymentMethodListRouter() -> PaymentMethodListRouterProtocol {
        let componentContainerAssembler = ComponentContainerAssembler(
            context: context,
            configuration: configuration,
            componentDelegate: componentDelegate,
            cardComponentDelegate: cardComponentDelegate,
            partialPaymentDelegate: partialPaymentDelegate
        )
        let router = PaymentMethodListRouter(componentContainerAssembler: componentContainerAssembler)
        let viewModel = PaymentMethodListViewModel(
            context: context,
            componentManager: componentManager,
            delegate: router,
            componentDelegate: componentDelegate,
            configuration: configuration
        )
        let view = PaymentMethodListViewController(viewModel: viewModel)
        router.view = view
        return router
    }
}
