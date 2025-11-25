//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// A typealias for a closure that handles a URL through which the application was opened.
@_spi(PlexyInternal)
public typealias AssertionListener = (String) -> Void

@_spi(PlexyInternal)
public enum PlexyAssertion {

    internal static var listener: AssertionListener?

    /// Calls `assertionFailure` when not running Tests.
    public static func assertionFailure(message: @autoclosure () -> String) {
        if CommandLine.arguments.contains("-UITests") {
            listener?(message())
            return
        }
        Swift.assertionFailure(message())
    }

    /// Calls `assertFailure(message:)` when condition is true.
    public static func assert(message: @autoclosure () -> String, condition: @autoclosure () -> Bool) {
        guard condition() else {
            return
        }
        assertionFailure(message: message())
    }
}
