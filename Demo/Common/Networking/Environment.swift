//
// Copyright (c) 2019 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Plexy
import PlexyNetworking
import Foundation

internal struct DemoAPIContext: AnyAPIContext {
    
    internal init(environment: AnyAPIEnvironment = ConfigurationConstants.demoServerEnvironment) {
        self.environment = environment
    }
    
    internal let environment: AnyAPIEnvironment
    
    internal let headers: [String: String] = [
        "Content-Type": "application/json",
        "X-API-Key": ConfigurationConstants.demoServerAPIKey
    ]
    
    internal let queryParameters: [URLQueryItem] = []
    
}

internal enum DemoCheckoutAPIEnvironment: String, AnyAPIEnvironment, CaseIterable {
    
    case beta, test, local
    
    internal var baseURL: URL {
        switch self {
        case .beta:
            return URL(string: "https://checkout-beta.plexy.com/checkout/v\(version)")!
        case .test:
            return URL(string: "https://checkout-test.plexy.com/v\(version)")!
        case .local:
            return URL(string: "http://localhost:8080/checkout/v\(version)")!
        }
    }

    internal var version: Int { ConfigurationConstants.current.apiVersion }
    
}

internal enum DemoClassicAPIEnvironment: String, AnyAPIEnvironment, CaseIterable {
    
    case beta, test, local
    
    internal var baseURL: URL {
        switch self {
        case .beta:
            return URL(string: "https://pal-beta.plexy.com/pal/servlet/")!
        case .test:
            return URL(string: "https://pal-test.plexy.com/pal/servlet/")!
        case .local:
            return URL(string: "http://localhost:8080/pal/servlet/")!
        }
    }
    
}
