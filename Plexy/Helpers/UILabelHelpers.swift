//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import UIKit

@_spi(PlexyInternal)
extension UILabel {
    
    /// Initializes UILabel with given `TextStyle`
    /// Sets `translatesAutoresizingMaskIntoConstraints` to `false`
    /// Sets `adjustsFontForContentSizeCategory` to `true`
    /// - Parameter style: `TextStyle` to be applied
    public convenience init(style: TextStyle) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        plexy.apply(style)
    }
    
}

public extension PlexyScope where Base: UILabel {
    
    /// Applies given `TextStyle` to the UILabel
    /// Sets `adjustsFontForContentSizeCategory` to `true`
    /// - Parameter style: `TextStyle` to be applied
    @_spi(PlexyInternal)
    func apply(_ style: TextStyle) {
        base.font = style.font
        base.textColor = style.color
        base.textAlignment = style.textAlignment
        base.backgroundColor = style.backgroundColor
        round(using: style.cornerRounding)
        
        base.adjustsFontForContentSizeCategory = true
    }
}
