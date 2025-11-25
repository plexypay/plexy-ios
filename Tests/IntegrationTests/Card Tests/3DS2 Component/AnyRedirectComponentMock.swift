//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import PlexyActions
@testable @_spi(PlexyInternal) import PlexyCard
import Foundation

final class AnyRedirectComponentMock: AnyRedirectComponent {
    
    var context: PlexyContext {
        Dummy.context
    }

    var delegate: ActionComponentDelegate?

    var onHandle: ((_ action: RedirectAction) -> Void)?

    func handle(_ action: RedirectAction) {
        onHandle?(action)
    }
}
