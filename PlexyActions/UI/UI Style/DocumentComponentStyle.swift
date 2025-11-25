//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import UIKit

/// Contains the styling customization options for the document action component.
public struct DocumentComponentStyle {
    
    /// The image style.
    public var image = ImageStyle(
        borderColor: nil,
        borderWidth: 0,
        cornerRadius: 8,
        clipsToBounds: true,
        contentMode: .scaleAspectFit
    )
    
    /// The done button style.
    public var doneButton = ButtonStyle(
        title: TextStyle(
            font: .preferredFont(forTextStyle: .headline),
            color: UIColor.Plexy.defaultBlue
        ),
        cornerRounding: .none,
        background: UIColor.clear
    )
    
    /// The main button style.
    public var mainButton = ButtonStyle(
        title: TextStyle(
            font: .preferredFont(forTextStyle: .headline),
            color: UIColor.Plexy.defaultBlue
        ),
        cornerRounding: .none,
        background: .clear
    )
    
    /// The message label style.
    public var messageLabel = TextStyle(
        font: .preferredFont(forTextStyle: .callout),
        color: UIColor.Plexy.componentLabel
    )
    
    /// The background color of the document action view.
    public var backgroundColor = UIColor.Plexy.componentBackground
    
    /// Initializes the document component style with the default style.
    public init() {}
}
