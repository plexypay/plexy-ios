//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

extension FormPickerSearchViewController {
    
    public struct Style: ViewStyle {
        
        public var backgroundColor: UIColor = .Plexy.componentBackground
        public var emptyView: EmptyView.Style = .init()
        
        public init() {}
    }
}
