//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
import PlexyComponents
import XCTest

internal extension PlexyCoder {

    static func decode<T: Decodable>(_ dictionary: [String: Any]) throws -> T {
        let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])

        return try decode(data)
    }

}
