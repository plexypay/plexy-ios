//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// A form item that represents an error.
@_spi(PlexyInternal)
public final class FormErrorItem: FormItem {

    /// Indicates the error message.
    @PlexyObservable(nil) public var message: String?

    /// The error icon name.
    public let iconName: String

    /// The error item style.
    public let style: FormErrorItemStyle

    public var identifier: String?

    public var isHidden: PlexyObservable<Bool> = PlexyObservable(true)

    public var subitems: [FormItem] = []

    /// Initializes the separator item.
    ///
    /// - Parameter message: The message.
    /// - Parameter iconName: The icon name.
    /// - Parameter style: a `FormErrorItemStyle` UI style.
    public init(message: String? = nil, iconName: String = "error", style: FormErrorItemStyle = FormErrorItemStyle()) {
        self.iconName = iconName
        self.style = style
        self.message = message
    }

    public func build(with builder: FormItemViewBuilder) -> AnyFormItemView {
        builder.build(with: self)
    }

}
