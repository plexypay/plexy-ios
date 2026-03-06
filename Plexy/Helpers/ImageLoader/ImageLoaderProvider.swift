//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

@_spi(PlexyInternal)
public final class ImageLoaderProvider {
    
    @PlexyDependency(\.imageLoader) private static var underlyingImageLoader
    
    public static func imageLoader() -> ImageLoading {
        underlyingImageLoader
    }
}
