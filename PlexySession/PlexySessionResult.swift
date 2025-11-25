//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Contains information regarding the status of a payment done via `PlexySession`.
public struct PlexySessionResult {
    
    /// The result code of the completed payment.
    public let resultCode: SessionPaymentResultCode
    
    /// An encoded string that can be used to get the payment outcome on your server.
    /// - Description: Use this value with the new  `/sessions/id` endpoint
    /// as a query string on your server to get a synchronous result for your payment.
    public let encodedResult: String?
}
