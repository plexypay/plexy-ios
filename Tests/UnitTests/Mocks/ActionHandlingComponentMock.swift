//
// Copyright (c) 2022 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
@_spi(PlexyInternal) import Plexy
@_spi(PlexyInternal) import PlexyActions

internal final class ActionHandlingComponentMock: ActionHandlingComponent {

    internal var context: PlexyContext {
        Dummy.context
    }
    
    internal var onAction: ((Action) -> Void)?
    
    internal func handle(_ action: Action) {
        onAction?(action)
    }
}
