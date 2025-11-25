//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
@_spi(PlexyInternal) import Plexy

internal struct PaymentInfo: Decodable {
    internal let cardType: CardType?
    internal let lastFour: String?
    internal let amount: Amount?
    
    private enum CodingKeys: String, CodingKey {
        case cardType = "brand"
        case lastFour
        case amount
    }
}
