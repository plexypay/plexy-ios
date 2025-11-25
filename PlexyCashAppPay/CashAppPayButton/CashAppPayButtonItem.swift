//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation
import UIKit

/// A form item that contains Cash App Pay's own button.
@available(iOS 13.0, *)
internal class CashAppPayButtonItem: FormItem {
    
    public var isHidden: PlexyObservable<Bool> = PlexyObservable(false)
    
    internal var subitems: [FormItem] = []
    
    internal var identifier: String?
    
    /// The observable of the button indicator activity.
    @PlexyObservable(false) public var showsActivityIndicator: Bool
    
    /// A closure that will be invoked when a button is selected.
    internal let selectionHandler: () -> Void
    
    internal init(selectionHandler: @escaping (() -> Void)) {
        self.selectionHandler = selectionHandler
    }
    
    internal func build(with builder: FormItemViewBuilder) -> AnyFormItemView {
        builder.build(with: self)
    }
}

@available(iOS 13.0, *)
extension FormItemViewBuilder {
    internal func build(with item: CashAppPayButtonItem) -> FormItemView<CashAppPayButtonItem> {
        CashAppPayButtonItemView(item: item)
    }
}
