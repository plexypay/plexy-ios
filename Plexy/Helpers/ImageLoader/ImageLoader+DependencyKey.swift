//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

import UIKit

extension PlexyDependencyValues {
    internal var imageLoader: ImageLoading {
        get { self[ImageLoaderKey.self] }
        set { self[ImageLoaderKey.self] = newValue }
    }
}

internal enum ImageLoaderKey: PlexyDependencyKey {
    internal static let liveValue: ImageLoading = ImageLoader()
}
