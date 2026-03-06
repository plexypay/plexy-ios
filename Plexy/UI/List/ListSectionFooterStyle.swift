//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
import UIKit

/// Contains the styling customization options for a list section footer.
public struct ListSectionFooterStyle: ViewStyle {

    /// The title style.
    public var title = TextStyle(
        font: .preferredFont(forTextStyle: .footnote),
        color: UIColor.Plexy.paidSectionFooterTitleColor,
        textAlignment: .center,
        cornerRounding: .fixed(6),
        backgroundColor: UIColor.Plexy.paidSectionFooterTitleBackgroundColor
    )

    /// Separator Color.
    public var separatorColor = UIColor.Plexy.componentSeparator

    public var backgroundColor = UIColor.Plexy.componentBackground

    /// Initializes the list header style.
    ///
    /// - Parameter title: The title style.
    public init(title: TextStyle) {
        self.title = title
    }

    /// Initializes the list header style with the default style.
    public init() {}

}
