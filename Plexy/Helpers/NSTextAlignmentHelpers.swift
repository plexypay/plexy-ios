//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import Foundation
import QuartzCore
import UIKit

@_spi(PlexyInternal)
extension NSTextAlignment: PlexyCompatible {}

@_spi(PlexyInternal)
public extension PlexyScope where Base == NSTextAlignment {
    var caAlignmentMode: CATextLayerAlignmentMode {
        switch base {
        case .center:
            return .center
        case .justified:
            return .justified
        case .left:
            return .left
        case .right:
            return .right
        case .natural:
            return .natural
        default:
            return .center
        }
    }
}
