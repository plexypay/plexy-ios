//
// Copyright (c) 2025 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import UIKit

@_spi(PlexyInternal)
public typealias IssuerPickerItem = BasePickerElement<Issuer>

@_spi(PlexyInternal)
public final class FormIssuersPickerItem: BaseFormPickerItem<Issuer> {

    override public init(preselectedValue: IssuerPickerItem, selectableValues: [IssuerPickerItem], style: FormTextItemStyle) {
        PlexyAssertion.assert(message: "selectableValues should be greater than 0", condition: selectableValues.count <= 0)
        super.init(preselectedValue: preselectedValue, selectableValues: selectableValues, style: style)
    }

    override public func build(with builder: FormItemViewBuilder) -> AnyFormItemView {
        builder.build(with: self)
    }

}
