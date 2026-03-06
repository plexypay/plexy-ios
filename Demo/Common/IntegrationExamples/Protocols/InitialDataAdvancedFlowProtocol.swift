//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import PlexyNetworking
import PlexySession

internal protocol InitialDataAdvancedFlowProtocol: AnyObject {
    var context: PlexyContext { get }
    var apiClient: APIClientProtocol { get }
    func requestPaymentMethods(
        order: PartialPaymentOrder?,
        amount: Amount,
        completion: @escaping (Result<PaymentMethods, Error>) -> Void
    )
    func generateContext() -> PlexyContext
    func start()
}

extension InitialDataAdvancedFlowProtocol {

    internal func requestPaymentMethods(
        order: PartialPaymentOrder?,
        amount: Amount = ConfigurationConstants.current.amount,
        completion: @escaping (Result<PaymentMethods, Error>) -> Void
    ) {
        let request = PaymentMethodsRequest(order: order, amount: amount)
        apiClient.perform(request) { result in
            switch result {
            case let .success(response):
                completion(.success(response.paymentMethods))
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

}
