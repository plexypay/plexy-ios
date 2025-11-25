//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

extension FormPickerSearchViewController.EmptyView {
    
    public struct Style: ViewStyle {
        
        public var title: TextStyle = .init(
            font: .preferredFont(forTextStyle: .headline),
            color: .Plexy.componentLabel
        )
        public var subtitle: TextStyle = .init(
            font: .preferredFont(forTextStyle: .subheadline),
            color: .Plexy.componentSecondaryLabel
        )
        public var backgroundColor: UIColor = .clear
        
        public init() {}
    }
}
