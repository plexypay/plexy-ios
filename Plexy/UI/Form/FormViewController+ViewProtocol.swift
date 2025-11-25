//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

@_spi(PlexyInternal)
public protocol FormViewProtocol {
    
    func add(item: (some FormItem)?)
    
    func displayValidation()
}

@_spi(PlexyInternal)
extension FormViewController: FormViewProtocol {

    public func add(item: (some FormItem)?) {
        guard let item else { return }
        append(item)
    }

    public func displayValidation() {
        resignFirstResponder()
        showValidation()
    }
}
