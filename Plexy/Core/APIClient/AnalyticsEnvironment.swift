//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import Foundation

/// Enum that defines the  analytics environment URLs..
@_spi(PlexyInternal)
public enum AnalyticsEnvironment: String, AnyAPIEnvironment {
    
    case test = "https://checkoutanalytics-test.plexy.com/"
    
    case liveEurope = "https://checkoutanalytics-live.plexy.com/"
    
    case liveAustralia = "https://checkoutanalytics-live-au.plexy.com/"
    
    case liveUnitedStates = "https://checkoutanalytics-live-us.plexy.com/"
    
    case liveApse = "https://checkoutanalytics-live-apse.plexy.com/"
    
    case liveIndia = "https://checkoutanalytics-live-in.plexy.com/"
    
    @_spi(PlexyInternal)
    case beta = "https://beta.plexy.com/checkoutanalytics/v3/analytics/"
    
    @_spi(PlexyInternal)
    case local = "http://localhost:8080/"
    
    public var baseURL: URL { URL(string: rawValue)! }
    
}

extension Environment {
    
    internal func toAnalyticsEnvironment() -> AnalyticsEnvironment {
        switch self {
        case .beta:
            return .beta
        case .test:
            return .test
        case .liveApse:
            return .liveApse
        case .liveIndia:
            return .liveIndia
        case .liveEurope:
            return .liveEurope
        case .liveAustralia:
            return .liveAustralia
        case .liveUnitedStates:
            return .liveUnitedStates
        case .local:
            return .local
        default:
            return .test
        }
    }
}
