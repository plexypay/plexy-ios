//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import UIKit

@_spi(PlexyInternal)
extension UIImageView {
    
    /// Initializes UIImageView with given `ImageStyle`
    /// Sets `translatesAutoresizingMaskIntoConstraints` to `false`
    /// - Parameter style: `ImageStyle` to be applied
    public convenience init(style: ImageStyle) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        plexy.apply(style)
    }
}

public extension PlexyScope where Base: UIImageView {
    
    /// Applies given `ImageStyle` to the UIImageView
    /// Sets `translatesAutoresizingMaskIntoConstraints` to `false`
    /// - Parameter style: `ImageStyle` to be applied
    @_spi(PlexyInternal)
    func apply(_ style: ImageStyle) {
        round(using: style.cornerRounding)
        base.layer.borderColor = style.borderColor?.cgColor
        base.layer.borderWidth = style.borderWidth
        base.backgroundColor = style.backgroundColor
        base.tintColor = style.tintColor
        base.clipsToBounds = style.clipsToBounds
    }
}
