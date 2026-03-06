//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) @testable import Plexy
@testable import PlexyActions
import Foundation

internal final class VoucherViewDelegateMock: VoucherViewDelegate {
    
    var onDidComplete: (() -> Void)?
    
    func didComplete() {
        onDidComplete?()
    }
    
    var onMainButtonTap: ((UIView, VoucherAction) -> Void)?

    func mainButtonTap(sourceView: UIView, action: VoucherAction) {
        onMainButtonTap?(sourceView, action)
    }
    
    var onAddToAppleWallet: ((VoucherAction) -> Void)?
    
    func addToAppleWallet(action: VoucherAction, completion: @escaping () -> Void) {
        onAddToAppleWallet?(action)
    }
    
    var onSecondaryButtonTap: ((UIView, VoucherAction) -> Void)?
    
    func secondaryButtonTap(sourceView: UIView, action: VoucherAction) {
        onSecondaryButtonTap?(sourceView, action)
    }
    
}
