//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

/// So that any `NSLayoutConstraint` instance will inherit the `plexy` scope.
@_spi(PlexyInternal)
extension NSLayoutConstraint: PlexyCompatible {}

/// Adds helper functionality to any `NSLayoutConstraint` instance through the `plexy` property.
@_spi(PlexyInternal)
extension PlexyScope where Base: NSLayoutConstraint {

    /// Apply `priority` to this instance of `NSLayoutConstraint`
    public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        base.priority = priority
        return base
    }

}
