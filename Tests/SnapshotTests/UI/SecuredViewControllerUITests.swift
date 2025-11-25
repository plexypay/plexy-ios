//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

import XCTest
@_spi(PlexyInternal) @testable import Plexy
@testable import PlexyCard
@testable import PlexyComponents

class SecuredViewControllerUITests: XCTestCase {
    
    override func run() {
        PlexyDependencyValues.runTestWithValues {
            $0.imageLoader = ImageLoaderMock()
        } perform: {
            super.run()
        }
    }
    
    func testBlur() throws {
        // temp deleted
    }
}
