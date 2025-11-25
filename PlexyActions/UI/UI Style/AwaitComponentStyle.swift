//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation
import UIKit

/// Contains the styling customization options for the await component.
public struct AwaitComponentStyle: ViewStyle {
    
    /// The image style.
    public var image = ImageStyle(
        borderColor: nil,
        borderWidth: 0,
        cornerRadius: 0,
        clipsToBounds: false,
        contentMode: .center
    )
    
    /// The style of message label.
    public var message = TextStyle(
        font: .preferredFont(forTextStyle: .callout),
        color: UIColor.Plexy.componentLabel
    )
    
    /// The style of the spinner title label.
    public var spinnerTitle = TextStyle(
        font: .preferredFont(forTextStyle: .footnote),
        color: UIColor.Plexy.componentLoadingMessageColor,
        textAlignment: .left
    )
    
    public var backgroundColor = UIColor.Plexy.componentBackground
    
    /// Initializes the await component style with the default style.
    public init() {}
}
