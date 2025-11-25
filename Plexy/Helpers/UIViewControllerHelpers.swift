//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import UIKit

/// Adds helper functionality to any `UIViewController` instance through the `plexy` property.
@_spi(PlexyInternal)
public extension PlexyScope where Base: UIViewController {
    
    /// Enables any `UIViewController` to access its top most presented view controller, e.g `viewController.plexy.topPresenter`.
    var topPresenter: UIViewController {
        var topController: UIViewController = self.base
        while let presenter = topController.presentedViewController {
            topController = presenter
        }
        return topController
    }
    
}

@_spi(PlexyInternal)
extension UIResponder: PlexyCompatible {}

@_spi(PlexyInternal)
extension PlexyScope where Base: UIResponder {

    func updatePreferredContentSize() {
        if let consumer = base as? PreferredContentSizeConsumer {
            consumer.willUpdatePreferredContentSize()
        }
        base.next?.plexy.updatePreferredContentSize()
        if let consumer = base as? PreferredContentSizeConsumer {
            consumer.didUpdatePreferredContentSize()
        }
    }
}

@_spi(PlexyInternal)
public protocol PreferredContentSizeConsumer {

    func didUpdatePreferredContentSize()

    func willUpdatePreferredContentSize()
}
