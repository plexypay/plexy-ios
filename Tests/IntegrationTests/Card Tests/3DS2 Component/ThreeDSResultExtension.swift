//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import PlexyActions
import Foundation

extension ThreeDSResult: Equatable {
    public static func == (lhs: ThreeDSResult, rhs: ThreeDSResult) -> Bool {
        lhs.payload == rhs.payload
    }
}
