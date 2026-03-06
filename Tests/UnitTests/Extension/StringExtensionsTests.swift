//
// Copyright (c) 2019 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
import XCTest

class StringExtensionsTests: XCTestCase {
    
    func testTruncateString() {
        XCTAssertEqual("".plexy.truncate(to: 2), "")
        XCTAssertEqual("a".plexy.truncate(to: 2), "a")
        XCTAssertEqual("a".plexy.truncate(to: 0), "")
        XCTAssertEqual("ab".plexy.truncate(to: 2), "ab")
        XCTAssertEqual("abcde".plexy.truncate(to: 2), "ab")
    }
    
    func testStringComponentsWithLength() {
        XCTAssertEqual("".plexy.components(withLength: 0), [])
        XCTAssertEqual("".plexy.components(withLength: 3), [])
        XCTAssertEqual("a".plexy.components(withLength: 3), ["a"])
        XCTAssertEqual("abcabc".plexy.components(withLength: 3), ["abc", "abc"])
        XCTAssertEqual("abcabca".plexy.components(withLength: 3), ["abc", "abc", "a"])
    }
    
    func testStringComponentsWithLengths() {
        XCTAssertEqual("".plexy.components(withLengths: [2, 1]), [])
        XCTAssertEqual("ab".plexy.components(withLengths: [2, 1]), ["ab"])
        XCTAssertEqual("abc".plexy.components(withLengths: [2, 1]), ["ab", "c"])
        XCTAssertEqual("abcde".plexy.components(withLengths: [2, 1]), ["ab", "c"])
        XCTAssertEqual("abcde".plexy.components(withLengths: [1, 1, 3]), ["a", "b", "cde"])
    }
    
    func testStringSubscriptWithPostion() {
        XCTAssertEqual("".plexy[1], "")
        XCTAssertEqual("abc".plexy[4], "")
        XCTAssertEqual("abc".plexy[-1], "")
        XCTAssertEqual("abc".plexy[0], "a")
        XCTAssertEqual("abc".plexy[1], "b")
        XCTAssertEqual("abc".plexy[2], "c")
    }
    
    func testStringSubscriptWithOpenRange() {
        XCTAssertEqual("abc".plexy[0..<2], "ab")
        XCTAssertEqual("abc".plexy[1..<2], "b")
    }
    
    func testStringSubscriptWithClosedRange() {
        XCTAssertEqual("abc".plexy[0...1], "ab")
        XCTAssertEqual("abc".plexy[0...2], "abc")
        XCTAssertEqual("abc".plexy[1...2], "bc")
    }
    
    func testClosedRanges() {
        let testString = "012345"
        XCTAssertEqual(testString.plexy[0...2], "012")
        XCTAssertEqual(testString.plexy[0...5], "012345")
        XCTAssertEqual(testString.plexy[3...6], "345")
        XCTAssertEqual(testString.plexy[2...3], "23")
        XCTAssertEqual(testString.plexy[2...2], "2")
        XCTAssertEqual(testString.plexy[1...4], "1234")
        XCTAssertEqual(testString.plexy[6...8], "")
        XCTAssertEqual(testString.plexy[-6...8], "012345")
        
        let empty = ""
        XCTAssertEqual(empty.plexy[0...2], "")
        XCTAssertEqual(empty.plexy[0...5], "")
        XCTAssertEqual(empty.plexy[3...6], "")
        XCTAssertEqual(empty.plexy[2...3], "")
        XCTAssertEqual(empty.plexy[2...2], "")
        XCTAssertEqual(empty.plexy[1...4], "")
        XCTAssertEqual(empty.plexy[6...8], "")
        XCTAssertEqual(empty.plexy[-6...8], "")
    }
    
    func testOpenRanges() {
        let testString = "012345"
        XCTAssertEqual(testString.plexy[0..<2], "01")
        XCTAssertEqual(testString.plexy[0..<5], "01234")
        XCTAssertEqual(testString.plexy[3..<6], "345")
        XCTAssertEqual(testString.plexy[2..<3], "2")
        XCTAssertEqual(testString.plexy[2..<2], "")
        XCTAssertEqual(testString.plexy[1..<4], "123")
        XCTAssertEqual(testString.plexy[6..<8], "")
        XCTAssertEqual(testString.plexy[-6..<8], "012345")
        
        let empty = ""
        XCTAssertEqual(empty.plexy[0..<2], "")
        XCTAssertEqual(empty.plexy[0..<5], "")
        XCTAssertEqual(empty.plexy[3..<6], "")
        XCTAssertEqual(empty.plexy[2..<3], "")
        XCTAssertEqual(empty.plexy[2..<2], "")
        XCTAssertEqual(empty.plexy[1..<4], "")
        XCTAssertEqual(empty.plexy[6..<8], "")
        XCTAssertEqual(empty.plexy[-6..<8], "")
    }
    
}
