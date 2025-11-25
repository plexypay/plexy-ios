//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
@_spi(PlexyInternal) @testable import Plexy

class CancellableMock: PlexyCancellable {
    
    private let onCancelHandler: () -> Void
    
    init(onCancelHandler: @escaping () -> Void) {
        self.onCancelHandler = onCancelHandler
    }
    
    func cancel() {
        onCancelHandler()
    }
}
