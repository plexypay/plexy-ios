//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@testable @_spi(PlexyInternal) import Plexy

class ImageLoaderMock: ImageLoading {
    
    var imageProvider: (URL) -> UIImage? = { url in
        url.absoluteString.generateImage()
    }
    
    var cancellable: PlexyCancellable = CancellableMock(onCancelHandler: {})
    
    func load(url: URL, completion: @escaping ((UIImage?) -> Void)) -> any PlexyCancellable {
        DispatchQueue.main.async {
            completion(self.imageProvider(url))
        }
        return cancellable
    }
}
