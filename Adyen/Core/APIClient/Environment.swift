//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import AdyenNetworking
import Foundation
    
/// :nodoc:
/// Struct that defines the environment to retrieve resources from.
public struct Environment: AnyAPIEnvironment {
    
    /// :nodoc:
    public var baseURL: URL

    /// :nodoc:
    /// Adyen's test environment.
    public static let test = Environment(baseURL: URL(string: "http://localhost:8080/")!)

    /// :nodoc:
    public static let beta = Environment(baseURL: URL(string: "http://localhost:8080/")!)
    
    /// :nodoc:
    /// Adyen's default live environment.
    public static let live = Environment(baseURL: URL(string: "http://localhost:8080/")!)
    
    /// :nodoc:
    /// Adyen's European live environment.
    public static let liveEurope = Environment.live
    
    /// :nodoc:
    /// Adyen's Australian live environment.
    public static let liveAustralia = Environment(baseURL: URL(string: "http://localhost:8080/")!)
    
    /// :nodoc:
    /// Adyen's United States live environment.
    public static let liveUnitedStates = Environment(baseURL: URL(string: "http://localhost:8080/")!)

    /// Initializes an `Environment` object.
    ///
    /// - Parameters:
    ///   - baseURL: The environment base url.
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }

}
