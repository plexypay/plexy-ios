//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
@testable @_spi(PlexyInternal) import PlexyCard
import XCTest

class CardSecurityCodeValidatorTests: XCTestCase {
    
    func testValidSecurityCodes() {
        let observer = PlexyObservable<CardType?>(.masterCard)
        let validator = CardSecurityCodeValidator(publisher: observer)
        
        XCTAssertTrue(validator.isValid("123"))
        XCTAssertFalse(validator.isValid("1234"))
        
        observer.wrappedValue = .americanExpress
        XCTAssertFalse(validator.isValid("123"))
        XCTAssertTrue(validator.isValid("1234"))
    }
    
    func testInvalidSecurityCodes() {
        let validator = CardSecurityCodeValidator()
        
        XCTAssertFalse(validator.isValid(""))
        XCTAssertFalse(validator.isValid("1"))
        XCTAssertFalse(validator.isValid("12"))
        XCTAssertFalse(validator.isValid("12345"))
    }
    
    func testEmptyInvalidStatus() {
        let validator = CardSecurityCodeValidator()
        let status = validator.validate("")
        
        XCTAssertNotNil(status.validationError)
        let validationError = status.validationError as? CardValidationError
        XCTAssertEqual(validationError, .securityCodeEmpty)
        XCTAssertEqual(validationError?.analyticsErrorCode, AnalyticsConstants.ValidationErrorCodes.securityCodeEmpty)
    }
    
    func testPartialInvalidStatus() {
        let validator = CardSecurityCodeValidator()
        let status = validator.validate("12")
        
        XCTAssertNotNil(status.validationError)
        let validationError = status.validationError as? CardValidationError
        XCTAssertEqual(validationError, .securityCodePartial)
        XCTAssertEqual(validationError?.analyticsErrorCode, AnalyticsConstants.ValidationErrorCodes.securityCodePartial)
    }
    
    func testValidStatusRegular() {
        let validator = CardSecurityCodeValidator()
        let status = validator.validate("123")
        
        XCTAssertNil(status.validationError)
        XCTAssertTrue(status.isValid)
    }
    
    func testValidStatusAmex() {
        let validator = CardSecurityCodeValidator(cardType: .americanExpress)
        let invalidStatus = validator.validate("123")
        
        XCTAssertNotNil(invalidStatus.validationError)
        XCTAssertFalse(invalidStatus.isValid)
        
        let validStatus = validator.validate("1234")
        XCTAssertNil(validStatus.validationError)
        XCTAssertTrue(validStatus.isValid)
    }
    
}
