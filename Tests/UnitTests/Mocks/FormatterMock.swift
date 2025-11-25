//
// Copyright (c) 2019 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation

final class FormatterMock: Plexy.Formatter {
    
    var handleFormattedValue: ((_ value: String) -> String)?
    func formattedValue(for value: String) -> String {
        handleFormattedValue?(value) ?? value
    }
    
    var handleSanitizedValue: ((_ value: String) -> String)?
    func sanitizedValue(for value: String) -> String {
        handleSanitizedValue?(value) ?? value
    }
    
}
