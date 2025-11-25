//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

@_spi(PlexyInternal)
public extension UIImageView {
    @discardableResult
    func load(
        url: URL,
        using imageLoader: ImageLoading,
        placeholder: UIImage? = nil
    ) -> PlexyCancellable {
        
        if let placeholder {
            self.image = placeholder
        }
        
        return imageLoader.load(url: url) { [weak self] image in
            self?.image = image ?? placeholder
        }
    }
}
