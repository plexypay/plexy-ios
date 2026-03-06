//
// Copyright (c) 2023 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import UIKit

extension PlexyDependencyValues {
    internal var openAppDetector: OpenExternalAppDetecting {
        get { self[OpenExternalAppDetectorKey.self] }
        set { self[OpenExternalAppDetectorKey.self] = newValue }
    }
}

internal enum OpenExternalAppDetectorKey: PlexyDependencyKey {
    internal static let liveValue: OpenExternalAppDetecting = OpenExternalAppDetector()
}
