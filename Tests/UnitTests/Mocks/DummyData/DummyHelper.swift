//
// Copyright (c) 2022 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

// To make Carthages work on CI
@_spi(PlexyInternal) @testable import Plexy

extension Dummy {

    internal static func context(with analyticsProvider: AnyAnalyticsProvider) -> PlexyContext {
        PlexyContext(
            apiContext: apiContext,
            payment: payment,
            analyticsProvider: analyticsProvider
        )
    }

}
