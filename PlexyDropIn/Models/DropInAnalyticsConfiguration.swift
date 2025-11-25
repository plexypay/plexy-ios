//
// Copyright (c) 2024 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation
@_spi(PlexyInternal) import Plexy

internal struct DropInAnalyticsConfiguration: AnalyticsStringDictionaryConvertible {
    
    private let skipPaymentMethodList: Bool
    
    private let openFirstStoredPaymentMethod: Bool
    
    internal init(configuration: DropInComponent.Configuration) {
        self.skipPaymentMethodList = configuration.allowsSkippingPaymentList
        self.openFirstStoredPaymentMethod = configuration.allowPreselectedPaymentView
    }
}
