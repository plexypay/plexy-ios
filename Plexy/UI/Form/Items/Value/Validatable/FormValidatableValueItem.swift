//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// A validatable item in a form in which holds a generic value.
@_spi(PlexyInternal)
open class FormValidatableValueItem<ValueType: Equatable>: FormValueItem<ValueType, FormTextItemStyle>, ValidatableFormItem {
    
    /// A message that is displayed when validation fails. Observable.
    @PlexyObservable(nil) public var validationFailureMessage: String?
    
    /// Closure that is triggered when there is a validation error.
    public var onDidShowValidationError: ((ValidationError) -> Void)?
    
    public func isValid() -> Bool {
        PlexyAssertion.assertionFailure(message: "'\(#function)' needs to be implemented on '\(String(describing: Self.self))'")
        return false
    }
    
    /// Checks the current validation status of the item.
    public func validationStatus() -> ValidationStatus? {
        PlexyAssertion.assertionFailure(message: "'\(#function)' needs to be implemented on '\(String(describing: Self.self))'")
        return nil
    }
}
