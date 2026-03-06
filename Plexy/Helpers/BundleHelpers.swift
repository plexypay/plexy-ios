//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import UIKit

/// So that any `Bundle` instance will inherit the `plexy` scope.
@_spi(PlexyInternal)
extension Bundle: PlexyCompatible {}

/// Adds helper functionality to any `Bundle` instance through the `plexy` property.
@_spi(PlexyInternal)
extension PlexyScope where Base: Bundle {
    
    /// Enables any `Bundle` instance to check whether a certain scheme is configured in the Info.plist or not.
    public func isSchemeConfigured(_ scheme: String) -> Bool {
        guard let configuredSchemes = base.object(forInfoDictionaryKey: "LSApplicationQueriesSchemes") as? [String] else {
            return false
        }
        guard configuredSchemes.contains(where: { $0.lowercased() == scheme.lowercased() }) else {
            return false
        }
        return true
    }
    
}

@_spi(PlexyInternal)
extension Bundle {
    
    public enum Plexy {
        
        public static var localizedEditCopy: String {
            Bundle(for: UIBarButtonItem.self).localizedString(forKey: "Edit", value: "Edit", table: nil)
        }
        
        public static var localizedDoneCopy: String {
            Bundle(for: UIBarButtonItem.self).localizedString(forKey: "Done", value: "Done", table: nil)
        }
    }
}
