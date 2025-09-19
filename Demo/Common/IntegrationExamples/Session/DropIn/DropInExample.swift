//
// Copyright (c) 2023 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(AdyenInternal) import Adyen
import AdyenActions
import AdyenCard
import AdyenCheckout
import AdyenComponents
import AdyenDropIn
import AdyenNetworking
import AdyenSession
import UIKit

internal final class DropInExample: InitialDataFlowProtocol {

    // MARK: - Properties

    internal weak var presenter: PresenterExampleProtocol?

    private var session: AdyenSession?
    private var dropInComponent: DropInComponent?
    
    internal lazy var apiClient = ApiClientHelper.generateApiClient()
    
    internal lazy var context: AdyenContext = generateContext()
    
    // MARK: - Initializers

    internal init() {}

    internal func start() {
        presenter?.showLoadingIndicator()
        
        Task {
            do {
                let sessionResponse = try await requestSessionInitialInfo()
                let component = await self.dropInComponent(from: sessionResponse)
                self.dropInComponent = component
                await hideLoading()
                await present(component: component)
            } catch {
                await hideLoading()
                await handleError(error)
            }
        }
    }
    
    // MARK: - Networking

    internal func requestSessionInitialInfo() async throws -> SessionResponse {
        let request = SessionRequest()
        return try await withCheckedThrowingContinuation { continuation in
            apiClient.perform(request) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    // MARK: - Presentation
    
    var adyenCheckout: AdyenCheckout?

    private func dropInComponent(from sessionResponse: SessionResponse) async -> DropInComponent {
        
        let checkoutConfiguration = try! CheckoutConfiguration(
            environment: ConfigurationConstants.componentsEnvironment,
            amount: ConfigurationConstants.current.amount,
            clientKey: ConfigurationConstants.clientKey,
            analyticsConfiguration: .init(
                isEnabled: ConfigurationConstants.current.analyticsSettings.isEnabled
            )
        ) {
            BLIKComponentConfiguration()
        }
        .onComplete { [weak self] result in
            self?.dismissAndShowAlert(
                result.resultCode.isSuccess,
                result.resultCode.rawValue
            )
        }
        
        let checkout = try! await AdyenCheckout.setup(with: sessionResponse.sessionId, sessionData: sessionResponse.sessionData, configuration: checkoutConfiguration, presentationDelegate: self)
        
        self.adyenCheckout = checkout
        
        let configuration = dropInConfiguration(from: checkout.paymentMethods!)
        
        let component = DropInComponent(
            paymentMethods: checkout.paymentMethods!,
            context: context,
            configuration: configuration,
            title: ConfigurationConstants.appName,
            componentDelegate: checkout,
            cardComponentDelegate: nil,
            partialPaymentDelegate: session,
            storedPaymentMethodsDelegate: session
        )
        
//        component.delegate = session

        return component
    }
    
    private func dropInConfiguration(from paymentMethods: PaymentMethods) -> DropInComponent.Configuration {
        let configuration = ConfigurationConstants.current.dropInConfiguration

        configuration.applePay = try? ConfigurationConstants.current.applePayConfiguration()
        configuration.actionComponent.threeDS.delegateAuthentication = ConfigurationConstants.delegatedAuthenticationConfigurations
        configuration.card = ConfigurationConstants.current.cardDropInConfiguration
        return configuration
    }

    // MARK: - Alert handling
    
    private func startLoading() {
        presenter?.showLoadingIndicator()
    }
    
    @MainActor
    private func handleError(_ error: Error) {
        presenter?.presentAlert(withTitle: "Error", message: error.localizedDescription)
    }
    
    @MainActor
    private func hideLoading() {
        presenter?.hideLoadingIndicator()
    }
    
    private func dismissAndShowAlert(_ success: Bool, _ message: String) {
        presenter?.dismiss {
            // Payment is processed. Add your code here.
            let title = success ? "Success" : "Error"
            self.presenter?.presentAlert(withTitle: title, message: message)
        }
    }

    private func presentAlert(with error: Error, retryHandler: (() -> Void)? = nil) {
        presenter?.presentAlert(with: error, retryHandler: retryHandler)
    }

}

extension DropInExample: AdyenSessionDelegate {

    func didComplete(with result: CheckoutResult, component: Component, session: AdyenSession) {
        dismissAndShowAlert(result.resultCode.isSuccess, result.resultCode.rawValue)
    }

    func didFail(with error: Error, from component: Component, session: AdyenSession) {
        if (error as? ComponentError) == .cancelled {
            presenter?.dismiss(completion: nil)
        } else {
            dismissAndShowAlert(false, error.localizedDescription)
        }
    }

    func didOpenExternalApplication(component: ActionComponent, session: AdyenSession) {}

}

extension DropInExample: PresentationDelegate {
    @MainActor
    internal func present(component: PresentableComponent) {
        // The implementation of this delegate method is not needed when using AdyenSession as the session handles the presentation
        let dropIn = component as! DropInComponent
        presenter?.present(viewController: dropIn.viewController, completion: nil)
    }
}

extension DropInExample {

    private func handleDisableResult(_ result: Result<DisableStoredPaymentMethodRequest.ResponseType, Error>, completion: (Bool) -> Void) {
        switch result {
        case let .failure(error):
            self.presenter?.presentAlert(with: error, retryHandler: nil)
            completion(false)
        case let .success(response):
            completion(response.response == .detailsDisabled)
        }
    }
}
