//
// Copyright (c) 2022 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import PlexyNetworking
import Foundation

/// API Client to handle ``PlexySession`` related requests.
/// All session related responses containing `sessionData` require updating the session data of the main `session` property,
/// which is passed as a weak reference to this class.
internal final class SessionAPIClient: APIClientProtocol {
    
    private let apiClient: APIClientProtocol
    
    private weak var session: PlexySession?
    
    internal init(apiClient: APIClientProtocol, session: PlexySession) {
        self.apiClient = apiClient
        self.session = session
    }
    
    internal func perform<R>(_ request: R, completionHandler: @escaping CompletionHandler<R.ResponseType>) where R: Request {
        apiClient.perform(request) { [weak self] result in
            // update session context with data and result code if exist
            if let response = try? result.get() {
                if let response = response as? SessionResponse {
                    self?.session?.sessionContext.data = response.sessionData
                }
                if let response = response as? SessionPaymentResultAware {
                    self?.session?.sessionContext.resultCode = response.resultCode
                    self?.session?.sessionContext.sessionResult = response.sessionResult
                }
            }
            completionHandler(result)
        }
    }
}
