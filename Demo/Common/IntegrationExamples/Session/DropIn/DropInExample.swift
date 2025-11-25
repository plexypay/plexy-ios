//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import PlexyActions
import PlexyCard
import PlexyComponents
import PlexyDropIn
import PlexyNetworking
import PlexySession
import UIKit

internal final class DropInExample: InitialDataFlowProtocol {

    // MARK: - Properties

    internal weak var presenter: PresenterExampleProtocol?

    private var session: PlexySession?
    private var dropInComponent: DropInComponent?
    
    internal lazy var apiClient = ApiClientHelper.generateApiClient()
    
    internal lazy var context: PlexyContext = generateContext()
    
    // MARK: - Initializers

    internal init() {}

    internal func start() {
        presenter?.showLoadingIndicator()
        loadSession { [weak self] response in
            guard let self else { return }
            
            self.presenter?.hideLoadingIndicator()
            
            switch response {
            case let .success(session):
                self.session = session
                self.presentComponent(with: session)
                
            case let .failure(error):
                self.presentAlert(with: error)
            }
        }
    }
    
    // MARK: - Networking

    private func loadSession(completion: @escaping (Result<PlexySession, Error>) -> Void) {
        requestPlexySessionConfiguration { [weak self] response in
            guard let self else { return }
            
            switch response {
            case let .success(config):
                PlexySession.initialize(
                    with: config,
                    delegate: self,
                    presentationDelegate: self,
                    completion: completion
                )
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Presentation
    
    private func presentComponent(with session: PlexySession) {
        let dropIn = dropInComponent(from: session)
        presenter?.present(viewController: dropIn.viewController, completion: nil)
        dropInComponent = dropIn
    }

    private func dropInComponent(from session: PlexySession) -> DropInComponent {
        let paymentMethods = session.sessionContext.paymentMethods
        let configuration = dropInConfiguration(from: paymentMethods)
        let component = DropInComponent(
            paymentMethods: paymentMethods,
            context: context,
            configuration: configuration,
            title: ConfigurationConstants.appName
        )
        
        component.delegate = session
        component.storedPaymentMethodsDelegate = session
        component.partialPaymentDelegate = session

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

    private func presentAlert(with error: Error, retryHandler: (() -> Void)? = nil) {
        presenter?.presentAlert(with: error, retryHandler: retryHandler)
    }

    private func dismissAndShowAlert(_ success: Bool, _ message: String) {
        presenter?.dismiss {
            // Payment is processed. Add your code here.
            let title = success ? "Success" : "Error"
            self.presenter?.presentAlert(withTitle: title, message: message)
        }
    }

}

extension DropInExample: PlexySessionDelegate {

    func didComplete(with result: PlexySessionResult, component: Component, session: PlexySession) {
        dismissAndShowAlert(result.resultCode.isSuccess, result.resultCode.rawValue)
    }

    func didFail(with error: Error, from component: Component, session: PlexySession) {
        if (error as? ComponentError) == .cancelled {
            presenter?.dismiss(completion: nil)
        } else {
            dismissAndShowAlert(false, error.localizedDescription)
        }
    }

    func didOpenExternalApplication(component: ActionComponent, session: PlexySession) {}

}

extension DropInExample: PresentationDelegate {
    internal func present(component: PresentableComponent) {
        // The implementation of this delegate method is not needed when using PlexySession as the session handles the presentation
    }
}
