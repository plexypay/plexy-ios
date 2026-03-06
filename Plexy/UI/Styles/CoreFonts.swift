//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
import UIKit

@_spi(PlexyInternal)
extension UIFont {
    
    internal enum PlexyCore {
        
        internal static var barTitle: UIFont {
            UIFont.preferredFont(forTextStyle: .title3).plexy.font(with: .semibold)
        }
        
    }
}
