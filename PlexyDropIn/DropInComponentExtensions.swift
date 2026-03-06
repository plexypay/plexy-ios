//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
#if canImport(PlexyComponents)
    import PlexyComponents
#endif
#if canImport(PlexyActions)
    @_spi(PlexyInternal) import PlexyActions
#endif
#if canImport(PlexyCard)
    @_spi(PlexyInternal) import PlexyCard
#endif
import PlexyNetworking
import UIKit

@_spi(PlexyInternal)
extension DropInComponent: PaymentMethodListComponentDelegate {

    internal func didLoad(_ paymentMethodListComponent: PaymentMethodListComponent) {
        sendDidLoadEvent()
    }
    
    internal func didSelect(
        _ component: PaymentComponent,
        in paymentMethodListComponent: PaymentMethodListComponent
    ) {
        (rootComponent as? ComponentLoader)?.startLoading(for: component)
        didSelect(component)
    }
    
    internal func didDelete(
        _ paymentMethod: StoredPaymentMethod,
        in paymentMethodListComponent: PaymentMethodListComponent,
        completion: @escaping (Bool) -> Void
    ) {
        let deletionCompletion = { [weak self] (success: Bool) in
            defer {
                completion(success)
            }
            guard success else { return }
            self?.paymentMethods.stored.removeAll(where: { $0 == paymentMethod })
            self?.reloadComponentManager()
        }
        
        if let sessionAsStoredPaymentMethodsDelegate {
            sessionAsStoredPaymentMethodsDelegate.disable(
                storedPaymentMethod: paymentMethod,
                dropInComponent: self,
                completion: deletionCompletion
            )
        } else {
            storedPaymentMethodsDelegate?.disable(
                storedPaymentMethod: paymentMethod,
                completion: deletionCompletion
            )
        }
    }
}

@_spi(PlexyInternal)
extension DropInComponent: PaymentComponentDelegate {
    
    public func didSubmit(_ data: PaymentComponentData, from component: PaymentComponent) {
        paymentInProgress = true
        
        let updatedData = data.replacing(checkoutAttemptId: component.context.analyticsProvider?.checkoutAttemptId)

        guard updatedData.browserInfo == nil else {
            self.delegate?.didSubmit(updatedData, from: component, in: self)
            return
        }
        updatedData.dataByAddingBrowserInfo { [weak self] in
            guard let self else { return }
            self.delegate?.didSubmit($0, from: component, in: self)
        }
        
    }
    
    public func didFail(with error: Error, from component: PaymentComponent) {
        if case ComponentError.cancelled = error {
            userDidCancel(component)
        } else {
            delegate?.didFail(with: error, from: self)
        }
    }

}

@_spi(PlexyInternal)
extension DropInComponent: ActionComponentDelegate {
    
    public func didOpenExternalApplication(component: ActionComponent) {
        stopLoading()
        delegate?.didOpenExternalApplication(component: component, in: self)
    }
    
    public func didComplete(from component: ActionComponent) {
        delegate?.didComplete(from: component, in: self)
    }
    
    public func didFail(with error: Error, from component: ActionComponent) {
        if case ComponentError.cancelled = error {
            userDidCancel(component)
        } else {
            delegate?.didFail(with: error, from: component, in: self)
        }
    }
    
    public func didProvide(_ data: ActionComponentData, from component: ActionComponent) {
        delegate?.didProvide(data, from: component, in: self)
    }
    
}

extension DropInComponent: PreselectedPaymentMethodComponentDelegate {

    internal func didProceed(with component: PaymentComponent) {
        (rootComponent as? ComponentLoader)?.startLoading(for: component)
        didSelect(component)
    }
    
    internal func didRequestAllPaymentMethods() {
        showPaymentMethodsList(onCancel: nil)
    }

    internal func showPaymentMethodsList(onCancel: (() -> Void)?) {
        let newList = paymentMethodListComponent(onCancel: onCancel)
        navigationController.present(root: newList)
        rootComponent = newList
    }
}

extension DropInComponent: NavigationDelegate {

    internal func dismiss(completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: true, completion: completion)
    }

    @_spi(PlexyInternal)
    public func present(component: PresentableComponent) {
        navigationController.present(asModal: component)
    }

}

extension DropInComponent: FinalizableComponent {

    public func didFinalize(with success: Bool, completion: (() -> Void)?) {
        stopLoading()
        if let finalizableComponent = selectedPaymentComponent as? FinalizableComponent {
            finalizableComponent.didFinalize(with: success, completion: completion)
        } else {
            completion?()
        }
    }
}

extension DropInComponent: ReadyToSubmitPaymentComponentDelegate {

    @_spi(PlexyInternal)
    public func showConfirmation(for component: InstantPaymentComponent, with order: PartialPaymentOrder?) {
        let newRoot = preselectedPaymentMethodComponent(for: component, onCancel: { [weak self] in
            guard let self, let order else { return }
            self.partialPaymentDelegate?.cancelOrder(order, component: self)
        })
        navigationController.present(root: newRoot)
        rootComponent = newRoot
    }
}

@_spi(PlexyInternal)
extension DropInComponent: TrackableComponent {
    public var analyticsFlavor: AnalyticsFlavor {
        let paymentMethodTypes = paymentMethods.regular.map(\.type.rawValue)
        return .dropIn(paymentMethods: paymentMethodTypes)
    }
    
    public func sendDidLoadEvent() {
        var infoEvent = AnalyticsEventInfo(component: "dropin", type: .rendered)
        infoEvent.configData = DropInAnalyticsConfiguration(configuration: configuration)
        context.analyticsProvider?.add(info: infoEvent)
    }
}
