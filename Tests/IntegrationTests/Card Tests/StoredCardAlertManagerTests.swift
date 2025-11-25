//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
@testable @_spi(PlexyInternal) import PlexyCard
import XCTest

class StoredCardAlertManagerTests: XCTestCase {
    
    let storedCardDictionary = [
        "type": "scheme",
        "id": "9314881977134903",
        "name": "VISA",
        "brand": "visa",
        "lastFour": "1111",
        "expiryMonth": "08",
        "expiryYear": "2018",
        "holderName": "test",
        "supportedShopperInteractions": [
            "Ecommerce",
            "ContAuth"
        ]
    ] as [String: Any]
    
    func testLocalizationWithCustomTableName() throws {
        let method = try PlexyCoder.decode(storedCardDictionary) as StoredCardPaymentMethod
        let amount = Amount(value: 3, currencyCode: "EUR")
        let sut = StoredCardAlertManager(
            paymentMethod: method,
            context: Dummy.context,
            amount: amount
        )
        sut.localizationParameters = LocalizationParameters(tableName: "PlexyUIHost", keySeparator: nil)
        
        let alertController = sut.alertController
        
        XCTAssertEqual(alertController.title, localizedString(.cardStoredTitle, sut.localizationParameters))
        let displayInformation = method.displayInformation(using: sut.localizationParameters)
        XCTAssertEqual(alertController.message, localizedString(.cardStoredMessage, sut.localizationParameters, displayInformation.title))
        
        XCTAssertNotNil(alertController.textFields)
        XCTAssertEqual(alertController.textFields?.count, 1)
        XCTAssertEqual(alertController.textFields?.first?.placeholder, localizedString(.cardCvcItemPlaceholder, sut.localizationParameters))
        XCTAssertEqual(alertController.textFields?.first?.accessibilityLabel, localizedString(.cardCvcItemTitle, sut.localizationParameters))
        
        XCTAssertEqual(alertController.actions.count, 2)
        XCTAssertEqual(alertController.actions.first?.title, localizedString(.cancelButton, sut.localizationParameters))
        XCTAssertEqual(alertController.actions[1].title, localizedSubmitButtonTitle(with: amount, style: .immediate, sut.localizationParameters))
    }
    
    func testLocalizationWithCustomKeySeparator() throws {
        let method = try PlexyCoder.decode(storedCardDictionary) as StoredCardPaymentMethod
        let amount = Amount(value: 3, currencyCode: "EUR")
        let sut = StoredCardAlertManager(
            paymentMethod: method,
            context: Dummy.context,
            amount: amount
        )
        sut.localizationParameters = LocalizationParameters(tableName: "PlexyUIHostCustomSeparator", keySeparator: "_")
        
        let alertController = sut.alertController
        
        XCTAssertEqual(alertController.title, localizedString(LocalizationKey(key: "plexy_card_stored_title"), sut.localizationParameters))
        let displayInformation = method.displayInformation(using: sut.localizationParameters)
        XCTAssertEqual(alertController.message, localizedString(LocalizationKey(key: "plexy_card_stored_message"), sut.localizationParameters, displayInformation.title))
        
        XCTAssertNotNil(alertController.textFields)
        XCTAssertEqual(alertController.textFields?.count, 1)
        XCTAssertEqual(alertController.textFields?.first?.placeholder, localizedString(LocalizationKey(key: "plexy_card_cvcItem_placeholder"), sut.localizationParameters))
        XCTAssertEqual(alertController.textFields?.first?.accessibilityLabel, localizedString(LocalizationKey(key: "plexy_card_cvcItem_title"), sut.localizationParameters))
        
        XCTAssertEqual(alertController.actions.count, 2)
        XCTAssertEqual(alertController.actions.first?.title, localizedString(LocalizationKey(key: "plexy_cancelButton"), sut.localizationParameters))
        XCTAssertEqual(alertController.actions[1].title, localizedSubmitButtonTitle(with: amount, style: .immediate, sut.localizationParameters))
    }
    
    func testResetFieldsAfterCancel() {
        let method = try! PlexyCoder.decode(storedCardDictionary) as StoredCardPaymentMethod
        let payment = Payment(amount: Amount(value: 174, currencyCode: "EUR"), countryCode: "NL")
        let sut = StoredCardAlertManager(
            paymentMethod: method,
            context: Dummy.context,
            amount: payment.amount
        )
        sut.localizationParameters = LocalizationParameters(tableName: "PlexyUIHost", keySeparator: nil)
        
        let alertController = sut.alertController
        let textField = alertController.textFields!.first!
        
        presentOnRoot(alertController)
        
        let payAction = alertController.actions.first { $0.title == localizedSubmitButtonTitle(with: payment.amount, style: .immediate, sut.localizationParameters) }!
        let cancelAction = alertController.actions.first { $0.title == localizedString(.cancelButton, sut.localizationParameters) }!
        
        textField.text = "111"
        textField.sendActions(for: .editingChanged)
        
        cancelAction.tap()
        
        XCTAssertTrue(textField.text!.isEmpty)
        XCTAssertFalse(payAction.isEnabled)
    }
    
}
