//
// Copyright (c) 2017 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import PlexyNetworking
import Foundation

@_spi(PlexyInternal)
public protocol APIRequest: Request where ErrorResponseType == APIError {}
