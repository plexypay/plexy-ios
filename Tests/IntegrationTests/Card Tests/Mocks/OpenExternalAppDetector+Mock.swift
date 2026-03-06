//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import PlexyActions

struct MockOpenExternalAppDetector: OpenExternalAppDetecting {
    var didOpenExternalApp: Bool
    func checkIfExternalAppDidOpen(_ completion: @escaping (Bool) -> Void) {
        completion(didOpenExternalApp)
    }
}
