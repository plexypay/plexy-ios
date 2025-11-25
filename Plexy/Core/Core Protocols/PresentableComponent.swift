//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
import UIKit

/// Describes any entity that is UI localizable.
public protocol Localizable {
    
    /// Indicates the localization parameters, leave it nil to use the default parameters.
    var localizationParameters: LocalizationParameters? { get set }
}

/// Represents any object than can handle a cancel event.
public protocol Cancellable: AnyObject {
    
    /// Called when the user cancels the component.
    func didCancel()
}

@_spi(PlexyInternal)
public protocol AnyNavigationBar: UIView {
    
    var onCancelHandler: (() -> Void)? { get set }
    
}

@_spi(PlexyInternal)
public enum NavigationBarType {
    case regular
    case custom(AnyNavigationBar)
}

/// A component that provides a view controller for the shopper to fill payment details.
public protocol PresentableComponent: Component {
    
    /// Indicates whether `viewController` expected to be presented modally,
    /// hence it can not handle its own presentation and dismissal.
    var requiresModalPresentation: Bool { get }
    
    /// Returns a view controller that presents the payment details for the shopper to fill.
    var viewController: UIViewController { get }
    
    /// Indicates whether Component implements a custom Navigation bar.
    @_spi(PlexyInternal)
    var navBarType: NavigationBarType { get }
}

/// A component that provides a view controller for the shopper to fill payment details.
public extension PresentableComponent {
    
    @_spi(PlexyInternal)
    var requiresModalPresentation: Bool { false }
    
    @_spi(PlexyInternal)
    var navBarType: NavigationBarType { .regular }
    
}
