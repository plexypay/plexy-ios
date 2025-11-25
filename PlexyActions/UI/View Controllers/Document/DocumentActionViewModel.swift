//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation

internal struct DocumentActionViewModel {
    
    internal let action: DocumentAction
    
    internal let message: String
    
    internal let logoURL: URL
    
    internal let buttonTitle: String
}
