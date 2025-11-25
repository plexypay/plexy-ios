//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation

internal final class WeChatPayAdditionalDetails: AdditionalDetails {
    
    internal let resultCode: String
    
    internal init(resultCode: String) {
        self.resultCode = resultCode
    }
    
}
