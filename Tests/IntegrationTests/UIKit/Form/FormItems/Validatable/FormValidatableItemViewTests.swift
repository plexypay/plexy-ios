//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
@_spi(PlexyInternal) import PlexyCard
import XCTest

private class FormValidatableValueItemMock: FormValidatableValueItem<String> {
    required init() {
        super.init(value: "", style: .init())
    }
}

private class FormValidatableValueItemViewMock: FormValidatableValueItemView<String, FormValidatableValueItemMock> {}

class FormValidatableItemViewTests: XCTestCase {
    
    private let item = FormValidatableValueItemMock()
    private lazy var sut = FormValidatableValueItemViewMock(item: item)
    
    override func tearDown() {
        PlexyAssertion.listener = nil
    }
    
    func testItemIsValidAssert() {
        PlexyAssertion.listener = { message in
            XCTAssertEqual(message, "'isValid()' needs to be implemented on 'FormValidatableValueItemMock'")
        }
        
        _ = item.isValid()
    }
    
    func testItemViewAccessibilityLabelViewAssert() {
        PlexyAssertion.listener = { message in
            XCTAssertEqual(message, "'accessibilityLabelView' needs to be implemented on 'FormValidatableValueItemViewMock'")
        }
        
        sut.resetValidationStatus()
    }
}
