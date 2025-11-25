//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
@_spi(PlexyInternal) @testable import PlexyActions
import XCTest

class MultibancoShareableVoucherViewProviderTests: XCTestCase {

    func testMultibancoVoucher() throws {
        let viewProvider = VoucherShareableViewProvider(
            style: VoucherComponentStyle(),
            environment: Dummy.apiContext.environment
        )

        let multibancoDecoded = try PlexyCoder.decode(multibancoVoucher) as MultibancoVoucherAction
        let action: VoucherAction = .multibanco(multibancoDecoded)

        let sut = viewProvider.provideView(with: action, logo: nil)

        let viewController = ADYViewController(view: sut)
        viewController.loadViewIfNeeded()

        let textLabel: UILabel! = sut.findView(by: "plexy.voucher.textLabel")
        XCTAssertEqual(textLabel.text, "Thank you for your purchase, please use the following information to complete your payment.")

        let amountLabel: UILabel! = sut.findView(by: "plexy.voucher.amountLabel")
        XCTAssertEqual(amountLabel.text, AmountFormatter.formatted(
            amount: multibancoDecoded.totalAmount.value,
            currencyCode: multibancoDecoded.totalAmount.currencyCode
        ))

        let expiryKeyLabel: UILabel! = sut.findView(by: "plexy.voucher.expirationKeyLabel")
        XCTAssertEqual(expiryKeyLabel.text, "Expiration Date")

        let expiryValueLabel: UILabel! = sut.findView(by: "plexy.voucher.expirationValueLabel")
        XCTAssertEqual(expiryValueLabel.text, "30/08/2021")
        
        let shopperReferenceKeyLabel: UILabel! = sut.findView(by: "plexy.voucher.shopperReferenceKeyLabel")
        XCTAssertEqual(shopperReferenceKeyLabel.text, "Shopper Reference")

        let shopperReferenceValueLabel: UILabel! = sut.findView(by: "plexy.voucher.shopperReferenceValueLabel")
        XCTAssertEqual(shopperReferenceValueLabel.text, "Test Order Reference - iOS UIHost")
        
        let entityKeyLabel: UILabel! = sut.findView(by: "plexy.voucher.entityKeyLabel")
        XCTAssertEqual(entityKeyLabel.text, "Entity")

        let entityValueLabel: UILabel! = sut.findView(by: "plexy.voucher.entityValueLabel")
        XCTAssertEqual(entityValueLabel.text, "11249")
    }

}
