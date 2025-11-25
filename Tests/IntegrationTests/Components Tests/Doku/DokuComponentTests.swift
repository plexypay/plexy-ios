//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
@testable import PlexyComponents
import XCTest

class DokuComponentTests: XCTestCase {

    private var context: PlexyContext!
    private var paymentMethod: DokuPaymentMethod!
    private var payment: Payment!

    override func setUpWithError() throws {
        try super.setUpWithError()
        context = Dummy.context

        paymentMethod = DokuPaymentMethod(type: .dokuAlfamart, name: "test_name")
        payment = Payment(amount: Amount(value: 2, currencyCode: "IDR"), countryCode: "ID")
    }

    override func tearDownWithError() throws {
        context = nil
        paymentMethod = nil
        payment = nil
        try super.tearDownWithError()
    }

    func testLocalizationWithCustomTableName() throws {
        let config = DokuComponent.Configuration(localizationParameters: LocalizationParameters(
            tableName: "PlexyUIHost",
            keySeparator: nil
        ))
        let sut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )

        XCTAssertEqual(sut.firstNameItem?.title, localizedString(.firstName, sut.configuration.localizationParameters))
        XCTAssertEqual(sut.firstNameItem?.placeholder, localizedString(.firstName, sut.configuration.localizationParameters))
        XCTAssertNil(sut.firstNameItem?.validationFailureMessage)

        XCTAssertEqual(sut.lastNameItem?.title, localizedString(.lastName, sut.configuration.localizationParameters))
        XCTAssertEqual(sut.lastNameItem?.placeholder, localizedString(.lastName, sut.configuration.localizationParameters))
        XCTAssertNil(sut.lastNameItem?.validationFailureMessage)

        XCTAssertEqual(sut.emailItem?.title, localizedString(.emailItemTitle, sut.configuration.localizationParameters))
        XCTAssertEqual(sut.emailItem?.placeholder, localizedString(.emailItemPlaceHolder, sut.configuration.localizationParameters))
        XCTAssertEqual(sut.emailItem?.validationFailureMessage, localizedString(.emailItemInvalid, sut.configuration.localizationParameters))

        XCTAssertNotNil(sut.button.title)
        XCTAssertEqual(sut.button.title, localizedString(.confirmPurchase, sut.configuration.localizationParameters))
    }

    func testLocalizationWithCustomKeySeparator() throws {
        let config = DokuComponent.Configuration(localizationParameters: LocalizationParameters(
            tableName: "PlexyUIHostCustomSeparator",
            keySeparator: "_"
        ))
        let sut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )

        XCTAssertEqual(sut.firstNameItem?.title, localizedString(LocalizationKey(key: "plexy_firstName"), sut.configuration.localizationParameters))
        XCTAssertEqual(sut.firstNameItem?.placeholder, localizedString(LocalizationKey(key: "plexy_firstName"), sut.configuration.localizationParameters))
        XCTAssertNil(sut.firstNameItem?.validationFailureMessage)

        XCTAssertEqual(sut.lastNameItem?.title, localizedString(LocalizationKey(key: "plexy_lastName"), sut.configuration.localizationParameters))
        XCTAssertEqual(sut.lastNameItem?.placeholder, localizedString(LocalizationKey(key: "plexy_lastName"), sut.configuration.localizationParameters))
        XCTAssertNil(sut.lastNameItem?.validationFailureMessage)

        XCTAssertEqual(sut.emailItem?.title, localizedString(LocalizationKey(key: "plexy_emailItem_title"), sut.configuration.localizationParameters))
        XCTAssertEqual(sut.emailItem?.placeholder, localizedString(LocalizationKey(key: "plexy_emailItem_placeHolder"), sut.configuration.localizationParameters))
        XCTAssertEqual(sut.emailItem?.validationFailureMessage, localizedString(LocalizationKey(key: "plexy_emailItem_invalid"), sut.configuration.localizationParameters))

        XCTAssertNotNil(sut.button.title)
        XCTAssertEqual(sut.button.title, localizedString(LocalizationKey(key: "plexy_confirmPurchase"), sut.configuration.localizationParameters))
    }

    func testBigTitle() {
        let sut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: DokuComponent.Configuration()
        )

        sut.viewController.loadViewIfNeeded()

        wait(for: .milliseconds(300))
        
        XCTAssertNil(sut.viewController.view.findView(with: "PlexyComponents.DokuComponent.Test name"))
        XCTAssertEqual(sut.viewController.title, self.paymentMethod.name)
    }

    func testRequiresModalPresentation() {
        let dokuPaymentMethod = DokuPaymentMethod(type: .dokuWallet, name: "Test name")
        let sut = DokuComponent(
            paymentMethod: dokuPaymentMethod,
            context: context,
            configuration: DokuComponent.Configuration()
        )
        XCTAssertEqual(sut.requiresModalPresentation, true)
    }

    func testDokuPrefilling() throws {
        // Given
        let config = DokuComponent.Configuration(shopperInformation: shopperInformation)
        let prefillSut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: config
        )
        
        setupRootViewController(prefillSut.viewController)

        // Then
        let view: UIView = prefillSut.viewController.view

        let firstNameView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.firstName))
        let expectedFirstName = try XCTUnwrap(shopperInformation.shopperName?.firstName)
        let firstName = firstNameView.item.value
        XCTAssertEqual(expectedFirstName, firstName)

        let lastNameView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.lastName))
        let expectedLastName = try XCTUnwrap(shopperInformation.shopperName?.lastName)
        let lastName = lastNameView.item.value
        XCTAssertEqual(expectedLastName, lastName)

        let emailView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.email))
        let expectedEmail = try XCTUnwrap(shopperInformation.emailAddress)
        let email = emailView.item.value
        XCTAssertEqual(expectedEmail, email)
    }

    func testDokuGivenNoShopperInformationShouldNotPrefill() throws {
        // Given
        let sut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: DokuComponent.Configuration()
        )
        setupRootViewController(sut.viewController)

        wait(for: .milliseconds(300))

        // Then
        let view: UIView = sut.viewController.view

        let firstNameView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.firstName))
        let firstName = firstNameView.item.value
        XCTAssertTrue(firstName.isEmpty)

        let lastNameView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.lastName))
        let lastName = lastNameView.item.value
        XCTAssertTrue(lastName.isEmpty)

        let emailView: FormTextInputItemView = try XCTUnwrap(view.findView(by: DokuViewIdentifier.email))
        let email = emailView.item.value
        XCTAssertTrue(email.isEmpty)
    }

    func testViewDidLoadShouldSendInitialCall() throws {
        // Given
        let analyticsProviderMock = AnalyticsProviderMock()
        let context = Dummy.context(with: analyticsProviderMock)
        let sut = DokuComponent(
            paymentMethod: paymentMethod,
            context: context,
            configuration: DokuComponent.Configuration()
        )

        // When
        sut.viewDidLoad(viewController: sut.viewController)

        // Then
        XCTAssertEqual(analyticsProviderMock.initialEventCallsCount, 1)
        XCTAssertEqual(analyticsProviderMock.infos.count, 1)
        let infoType = analyticsProviderMock.infos.first?.type
        XCTAssertEqual(infoType, .rendered)
    }

    // MARK: - Private

    private enum DokuViewIdentifier {
        static let firstName = "PlexyComponents.DokuComponent.firstNameItem"
        static let lastName = "PlexyComponents.DokuComponent.lastNameItem"
        static let email = "PlexyComponents.DokuComponent.emailItem"
        static let payButton = "PlexyComponents.DokuComponent.payButtonItem.button"
    }

    private var shopperInformation: PrefilledShopperInformation {
        let billingAddress = PostalAddressMocks.newYorkPostalAddress
        let deliveryAddress = PostalAddressMocks.losAngelesPostalAddress
        return .init(
            shopperName: ShopperName(firstName: "Katrina", lastName: "Del Mar"),
            emailAddress: "katrina@mail.com",
            phoneNumber: .init(value: "1234567890", callingCode: "+1"),
            billingAddress: billingAddress,
            deliveryAddress: deliveryAddress,
            socialSecurityNumber: "78542134370"
        )
    }
}
