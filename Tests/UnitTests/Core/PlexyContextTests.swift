//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@testable @_spi(PlexyInternal) import Plexy
@testable import PlexyEncryption
@testable import PlexyNetworking
import XCTest

class PlexyContextTests: XCTestCase {
    
    func testAdditionalFieldsBinding() {

        let oneEUR = Amount(value: 1, currencyCode: "EUR")
        let twoEUR = Amount(value: 2, currencyCode: "EUR")
        
        let apiContext = try! APIContext(environment: Environment.test, clientKey: "local_DUMMYKEYFORTESTING")
        let context = PlexyContext(
            apiContext: apiContext,
            payment: .init(amount: oneEUR, countryCode: "NL")
        )
        
        XCTAssertEqual(context.payment?.amount, oneEUR)
        context.update(payment: Payment(amount: twoEUR, countryCode: "NL"))
        XCTAssertEqual(context.payment?.amount, twoEUR)
    }
    
    func testPublicInit() {
        let context = PlexyContext(apiContext: Dummy.apiContext, payment: Dummy.payment)
        
        XCTAssertEqual(context.payment?.amount, Dummy.payment.amount)
        XCTAssertEqual(context.apiContext.clientKey, Dummy.apiContext.clientKey)
    }
    
    func testInternalInit() {
        let context = PlexyContext(apiContext: Dummy.apiContext, payment: Dummy.payment, analyticsProvider: AnalyticsProviderMock())
        
        XCTAssertEqual(context.payment?.amount, Dummy.payment.amount)
        XCTAssertEqual(context.apiContext.clientKey, Dummy.apiContext.clientKey)
        XCTAssertNotNil(context.analyticsProvider)
    }
    
    func testInitWithRegularEnvironmentShouldHaveAnalyticsProvider() {
        let context = PlexyContext(apiContext: Dummy.apiContext, payment: Dummy.payment)
        
        XCTAssertNotNil(context.analyticsProvider)
    }
    
    func testInitWithDifferentEnvironmentShouldNotHaveAnalyticsProvider() {
        let apiContext = try! APIContext(environment: TestEnvironment.test, clientKey: "local_DUMMYKEYFORTESTING")
        
        let context = PlexyContext(apiContext: apiContext, payment: Dummy.payment)
        XCTAssertNil(context.analyticsProvider)
    }
    
    func testBothAnalyticsProviderShouldBeCreated() {
        let context = PlexyContext(
            apiContext: Dummy.apiContext,
            payment: Dummy.payment,
            analyticsConfiguration: AnalyticsConfiguration()
        )
        
        XCTAssertNotNil(context.analyticsProvider)
        XCTAssertNotNil((context.analyticsProvider as? AnalyticsProvider)?.eventAnalyticsProvider)
    }
    
    func testOnlyAnalyticsProviderShouldBeCreated() {
        var config = AnalyticsConfiguration()
        config.isEnabled = false
        
        let context = PlexyContext(
            apiContext: Dummy.apiContext,
            payment: Dummy.payment,
            analyticsConfiguration: config
        )
        
        XCTAssertNotNil(context.analyticsProvider)
        XCTAssertNil((context.analyticsProvider as? AnalyticsProvider)?.eventAnalyticsProvider)
    }
}

enum TestEnvironment: AnyAPIEnvironment {
    case test
    
    var baseURL: URL { URL(string: "test")! }
}
