//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import PlexyNetworking
import PlexySession

internal protocol InitialDataFlowProtocol: AnyObject {
    var context: PlexyContext { get }
    var apiClient: APIClientProtocol { get }
    func requestPlexySessionConfiguration(completion: @escaping (Result<PlexySession.Configuration, Error>) -> Void)
    func generateContext() -> PlexyContext
    func start()
}

extension InitialDataFlowProtocol {

    internal func requestPlexySessionConfiguration(completion: @escaping (Result<PlexySession.Configuration, Error>) -> Void) {
        let request = SessionRequest()
        apiClient.perform(request) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(response):
                let config = self.initializeSession(with: response.sessionId, data: response.sessionData)
                completion(.success(config))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func generateContext() -> PlexyContext {
        var analyticsConfiguration = AnalyticsConfiguration()
        analyticsConfiguration.isEnabled = ConfigurationConstants.current.analyticsSettings.isEnabled
        return PlexyContext(
            apiContext: ConfigurationConstants.apiContext,
            payment: ConfigurationConstants.current.payment,
            analyticsConfiguration: analyticsConfiguration
        )
    }

    private func initializeSession(with sessionId: String, data: String) -> PlexySession.Configuration {
        let configuration = PlexySession.Configuration(
            sessionIdentifier: sessionId,
            initialSessionData: data,
            context: context,
            actionComponent: .init(
                threeDS: .init(
                    requestorAppURL: ConfigurationConstants.returnUrl,
                    delegateAuthentication: ConfigurationConstants.delegatedAuthenticationConfigurations
                ),
                twint: .init(callbackAppScheme: ConfigurationConstants.returnUrl.scheme!)
            )
        )
        return configuration
    }
}

extension SessionPaymentResultCode {
    var isSuccess: Bool {
        self == .authorised || self == .received || self == .pending
    }
}
