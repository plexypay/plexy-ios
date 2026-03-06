//
// Copyright (c) 2019 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
import XCTest

class URLExtensionsTests: XCTestCase {
    
    func testQueryParametersWithNoParameters() {
        let url = URL(string: "url://")!
        let parameters = url.plexy.queryParameters
        
        XCTAssertEqual(parameters.isEmpty, true)
    }
    
    func testQueryParametersWithMultipleParameters() {
        let url = URL(string: "url://?a=aParameter&b=2&c=c")!
        let parameters = url.plexy.queryParameters
        
        XCTAssertEqual(parameters.count, 3)
        XCTAssertEqual(parameters["a"], "aParameter")
        XCTAssertEqual(parameters["b"], "2")
        XCTAssertEqual(parameters["c"], "c")
    }
}
