//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
@_spi(PlexyInternal) @testable import PlexyActions
import XCTest

class BoletoVoucherShareableVoucherViewProviderTests: XCTestCase {

    func testBoletoBancairoVoucher() throws {
        let viewProvider = VoucherShareableViewProvider(
            style: VoucherComponentStyle(),
            environment: Dummy.apiContext.environment
        )

        let boletoDecoded = try PlexyCoder.decode(boletoAction) as BoletoVoucherAction
        let action: VoucherAction = .boletoBancairoSantander(boletoDecoded)

        let sut = viewProvider.provideView(with: action, logo: nil)

        let viewController = ADYViewController(view: sut)
        viewController.loadViewIfNeeded()

        let textLabel: UILabel! = sut.findView(by: "plexy.voucher.textLabel")
        XCTAssertEqual(textLabel.text, "Thank you for your purchase, please use the following information to complete your payment.")

        let amountLabel: UILabel! = sut.findView(by: "plexy.voucher.amountLabel")
        XCTAssertEqual(amountLabel.text, AmountFormatter.formatted(
            amount: boletoDecoded.totalAmount.value,
            currencyCode: boletoDecoded.totalAmount.currencyCode
        ))

        let expiryKeyLabel: UILabel! = sut.findView(by: "plexy.voucher.expirationKeyLabel")
        XCTAssertEqual(expiryKeyLabel.text, "Expiration Date")

        let expiryValueLabel: UILabel! = sut.findView(by: "plexy.voucher.expirationValueLabel")
        XCTAssertEqual(expiryValueLabel.text, "30/05/2021")
    }
}
