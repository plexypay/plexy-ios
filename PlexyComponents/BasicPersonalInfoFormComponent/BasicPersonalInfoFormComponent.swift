//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(PlexyInternal) import Plexy
import Foundation
import UIKit

/// A component that provides a form consisting of first name, last name, phone, and email.
public final class BasicPersonalInfoFormComponent: AbstractPersonalInformationComponent {

    /// Configuration for Basic Personal Information Component
    public typealias Configuration = PersonalInformationConfiguration
    
    /// Initializes the component.
    /// - Parameters:
    ///   - paymentMethod: The payment method.
    ///   - context: The context object for this component.
    ///   - configuration: The component's configuration.
    public init(
        paymentMethod: PaymentMethod,
        context: PlexyContext,
        configuration: Configuration = .init()
    ) {
        super.init(
            paymentMethod: paymentMethod,
            context: context,
            fields: [.firstName, .lastName, .phone, .email],
            configuration: configuration
        )
    }

    @_spi(PlexyInternal)
    override public func phoneExtensions() -> [PhoneExtension] {
        let query = PhoneExtensionsQuery(paymentMethod: .generic)
        return PhoneExtensionsRepository.get(with: query)
    }

    @_spi(PlexyInternal)
    override public func submitButtonTitle() -> String {
        localizedString(.confirmPurchase, configuration.localizationParameters)
    }

    @_spi(PlexyInternal)
    override public func createPaymentDetails() throws -> PaymentMethodDetails {
        guard let firstNameItem,
              let lastNameItem,
              let emailItem,
              let phoneItem else {
            throw UnknownError(errorDescription: "There seems to be an error in the BasicPersonalInfoFormComponent configuration.")
        }
        return BasicPersonalInfoFormDetails(
            paymentMethod: paymentMethod,
            firstName: firstNameItem.value,
            lastName: lastNameItem.value,
            emailAddress: emailItem.value,
            telephoneNumber: phoneItem.phoneNumber
        )
    }
}

/// Provides a form for personal information, required for E-context ATM  payments.
public typealias EContextATMComponent = BasicPersonalInfoFormComponent

/// Provides a form for personal information, required for E-context Store payments.
public typealias EContextStoreComponent = BasicPersonalInfoFormComponent

/// Provides a form for personal information, required for E-context Online  payments.
public typealias EContextOnlineComponent = BasicPersonalInfoFormComponent

/// Provides a form for personal information, required for 7eleven  payments.
public typealias SevenElevenComponent = BasicPersonalInfoFormComponent
