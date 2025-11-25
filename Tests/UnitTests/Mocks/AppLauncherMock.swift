//
// Copyright (c) 2020 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
import Foundation

final class AppLauncherMock: AnyAppLauncher {
    
    var onOpenCustomSchemeUrl: ((_ url: URL, _ completion: ((Bool) -> Void)?) -> Void)?
    
    func openCustomSchemeUrl(_ url: URL, completion: ((Bool) -> Void)?) {
        onOpenCustomSchemeUrl?(url, completion)
    }
    
    var onOpenUniversalAppUrl: ((_ url: URL, _ completion: ((Bool) -> Void)?) -> Void)?
    
    func openUniversalAppUrl(_ url: URL, completion: ((Bool) -> Void)?) {
        onOpenUniversalAppUrl?(url, completion)
    }
    
}
