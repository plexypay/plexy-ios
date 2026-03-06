//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import func Darwin.fputs

/// Provides control over SDK logging.
public enum PlexyLogging {
    /// Indicates whether to enable printing to the console.
    public static var isEnabled: Bool = false {
        didSet {
            PlexyNetworking.Logging.isEnabled = isEnabled
        }
    }
}

/// Copies the interface of `Swift.print()`,
/// and `Swift.print()` is called inside after checking first if `PlexyLogging.isEnabled` is `true`, and returns if `false`.
@_spi(PlexyInternal)
public func plexyPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    guard PlexyLogging.isEnabled else { return }
    var idx = items.startIndex
    let endIdx = items.endIndex
    
    repeat {
        Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
        idx += 1
    } while idx < endIdx
}
