//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// An selectable item in a form in which holds a generic value.
@_spi(PlexyInternal)
open class FormSelectableValueItem<ValueType: Equatable>: FormValidatableValueItem<ValueType> {
    
    /// The placeholder of the item.
    public let placeholder: String
    
    /// A closure that will be invoked when the item is selected.
    public var selectionHandler: () -> Void
    
    /// The formatted value to show in the view
    @PlexyObservable(nil) public var formattedValue: String?
    
    public init(
        value: ValueType,
        style: FormTextItemStyle,
        placeholder: String
    ) {
        self.placeholder = placeholder
        
        selectionHandler = {
            PlexyAssertion.assertionFailure(message: "'selectionHandler' needs to be provided on '\(String(describing: Self.self))'")
        }
        
        super.init(value: value, style: style)
    }
}
