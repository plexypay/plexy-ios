//
// Copyright (c) 2021 Plexy N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

// swiftlint:disable all
@_spi(PlexyInternal)
public struct LocalizationKey {

    /// Pay
    public static let submitButton = LocalizationKey(key: "plexy.submitButton")
    /// Pay %@
    public static let submitButtonFormatted = LocalizationKey(key: "plexy.submitButton.formatted")
    /// Cancel
    public static let cancelButton = LocalizationKey(key: "plexy.cancelButton")
    /// OK
    public static let dismissButton = LocalizationKey(key: "plexy.dismissButton")
    /// Remove
    public static let removeButton = LocalizationKey(key: "plexy.removeButton")
    /// Error
    public static let errorTitle = LocalizationKey(key: "plexy.error.title")
    /// An unknown error occurred
    public static let errorUnknown = LocalizationKey(key: "plexy.error.unknown")
    /// Invalid Input
    public static let validationAlertTitle = LocalizationKey(key: "plexy.validationAlert.title")
    /// Others
    public static let paymentMethodsOtherMethods = LocalizationKey(key: "plexy.paymentMethods.otherMethods")
    /// Stored
    public static let paymentMethodsStoredMethods = LocalizationKey(key: "plexy.paymentMethods.storedMethods")
    /// Applied
    public static let paymentMethodsPaidMethods = LocalizationKey(key: "plexy.paymentMethods.paidMethods")
    /// Payment Methods
    public static let paymentMethodsTitle = LocalizationKey(key: "plexy.paymentMethods.title")
    /// Yes, remove
    public static let paymentMethodRemoveButton = LocalizationKey(key: "plexy.paymentMethod.removeButton")
    /// The payment was refused. Please try again.
    public static let paymentRefusedMessage = LocalizationKey(key: "plexy.payment.refused.message")
    /// Account Number (IBAN)
    public static let sepaIbanItemTitle = LocalizationKey(key: "plexy.sepa.ibanItem.title")
    /// Invalid account number
    public static let sepaIbanItemInvalid = LocalizationKey(key: "plexy.sepa.ibanItem.invalid")
    /// Holder Name
    public static let sepaNameItemTitle = LocalizationKey(key: "plexy.sepa.nameItem.title")
    /// J. Smith
    public static let sepaNameItemPlaceholder = LocalizationKey(key: "plexy.sepa.nameItem.placeholder")
    /// By pressing the button above, you agree that the specified amount will be debited from your bank account.
    public static let sepaConsentLabel = LocalizationKey(key: "plexy.sepa.consentLabel")
    /// Holder name invalid
    public static let sepaNameItemInvalid = LocalizationKey(key: "plexy.sepa.nameItem.invalid")
    /// Remember for next time
    public static let cardStoreDetailsButton = LocalizationKey(key: "plexy.card.storeDetailsButton")
    /// Name on card
    public static let cardNameItemTitle = LocalizationKey(key: "plexy.card.nameItem.title")
    /// J. Smith
    public static let cardNameItemPlaceholder = LocalizationKey(key: "plexy.card.nameItem.placeholder")
    /// Enter name as shown on card
    public static let cardNameItemInvalid = LocalizationKey(key: "plexy.card.nameItem.invalid")
    /// Card number
    public static let cardNumberItemTitle = LocalizationKey(key: "plexy.card.numberItem.title")
    /// 1234 5678 9012 3456
    public static let cardNumberItemPlaceholder = LocalizationKey(key: "plexy.card.numberItem.placeholder")
    /// Invalid card number
    public static let cardNumberItemInvalid = LocalizationKey(key: "plexy.card.numberItem.invalid")
    /// Expiry date
    public static let cardExpiryItemTitle = LocalizationKey(key: "plexy.card.expiryItem.title")
    /// Expiry date (optional)
    public static let cardExpiryItemTitleOptional = LocalizationKey(key: "plexy.card.expiryItem.title.optional")
    /// MM/YY
    public static let cardExpiryItemPlaceholder = LocalizationKey(key: "plexy.card.expiryItem.placeholder")
    /// Invalid expiry date
    public static let cardExpiryItemInvalid = LocalizationKey(key: "plexy.card.expiryItem.invalid")
    /// Month, 2 digits, Year, 2 digits
    public static let cardExpiryItemAccessibilityLabel = LocalizationKey(key: "plexy.card.expiryItem.accessibilityLabel")
    /// Invalid CVC / CVV format
    public static let cardCvcItemInvalid = LocalizationKey(key: "plexy.card.cvcItem.invalid")
    /// Security code
    public static let cardCvcItemTitle = LocalizationKey(key: "plexy.card.cvcItem.title")
    /// 123
    public static let cardCvcItemPlaceholder = LocalizationKey(key: "plexy.card.cvcItem.placeholder")
    /// Verify your card
    public static let cardStoredTitle = LocalizationKey(key: "plexy.card.stored.title")
    /// Please enter the CVC code for %@
    public static let cardStoredMessage = LocalizationKey(key: "plexy.card.stored.message")
    /// Expires %@
    public static let cardStoredExpires = LocalizationKey(key: "plexy.card.stored.expires")
    /// %@ isn't supported
    public static let cardNumberItemUnsupportedBrand = LocalizationKey(key: "plexy.card.numberItem.unsupportedBrand")
    /// The entered card brand isn't supported
    public static let cardNumberItemUnknownBrand = LocalizationKey(key: "plexy.card.numberItem.unknownBrand")
    /// Scan your card
    public static let cardScanYourCardButton = LocalizationKey(key: "plexy.card.scanYourCardButton")
    /// Card Brand
    public static let creditCardDualBrandTitle = LocalizationKey(key: "plexy.creditCard.dualBrand.title")
    /// Select the card brand you prefer to pay with. This is optional.
    public static let creditCardDualBrandDescription = LocalizationKey(key: "plexy.creditCard.dualBrand.description")
    /// Confirm %@ payment
    public static let dropInStoredTitle = LocalizationKey(key: "plexy.dropIn.stored.title")
    /// Change Payment Method
    public static let dropInPreselectedOpenAllTitle = LocalizationKey(key: "plexy.dropIn.preselected.openAll.title")
    /// Continue to %@
    public static let continueTo = LocalizationKey(key: "plexy.continueTo")
    /// Continue
    public static let continueTitle = LocalizationKey(key: "plexy.continueTitle")
    /// Telephone number
    public static let phoneNumberTitle = LocalizationKey(key: "plexy.phoneNumber.title")
    /// Invalid telephone number
    public static let phoneNumberInvalid = LocalizationKey(key: "plexy.phoneNumber.invalid")
    /// Prefix
    public static let telephonePrefix = LocalizationKey(key: "plexy.telephonePrefix")
    /// 123–456–789
    public static let phoneNumberPlaceholder = LocalizationKey(key: "plexy.phoneNumber.placeholder")
    /// %@ digits
    public static let cardCvcItemPlaceholderDigits = LocalizationKey(key: "plexy.card.cvcItem.placeholder.digits")
    /// Email address
    public static let emailItemTitle = LocalizationKey(key: "plexy.emailItem.title")
    /// Email address
    public static let emailItemPlaceHolder = LocalizationKey(key: "plexy.emailItem.placeHolder")
    /// Invalid email address
    public static let emailItemInvalid = LocalizationKey(key: "plexy.emailItem.invalid")
    /// More options
    public static let moreOptions = LocalizationKey(key: "plexy.moreOptions")
    /// Total
    public static let applePayTotal = LocalizationKey(key: "plexy.applePay.total")
    /// Confirm your payment on the MB WAY app
    public static let mbwayConfirmPayment = LocalizationKey(key: "plexy.mbway.confirmPayment")
    /// Waiting for confirmation
    public static let awaitWaitForConfirmation = LocalizationKey(key: "plexy.await.waitForConfirmation")
    /// Open your banking app to confirm the payment.
    public static let blikConfirmPayment = LocalizationKey(key: "plexy.blik.confirmPayment")
    /// Enter 6 numbers
    public static let blikInvalid = LocalizationKey(key: "plexy.blik.invalid")
    /// 6-digit code
    public static let blikCode = LocalizationKey(key: "plexy.blik.code")
    /// Get the code from your banking app.
    public static let blikHelp = LocalizationKey(key: "plexy.blik.help")
    /// 123–456
    public static let blikPlaceholder = LocalizationKey(key: "plexy.blik.placeholder")
    /// Preauthorize with %@
    public static let preauthorizeWith = LocalizationKey(key: "plexy.preauthorizeWith")
    /// Confirm preauthorization
    public static let confirmPreauthorization = LocalizationKey(key: "plexy.confirmPreauthorization")
    /// Security code (optional)
    public static let cardCvcItemTitleOptional = LocalizationKey(key: "plexy.card.cvcItem.title.optional")
    /// Confirm purchase
    public static let confirmPurchase = LocalizationKey(key: "plexy.confirmPurchase")
    /// Last name
    public static let lastName = LocalizationKey(key: "plexy.lastName")
    /// First name
    public static let firstName = LocalizationKey(key: "plexy.firstName")
    /// Pin
    public static let cardPinTitle = LocalizationKey(key: "plexy.card.pin.title")
    /// Incomplete field
    public static let missingField = LocalizationKey(key: "plexy.missingField")
    /// Redeem
    public static let cardApplyGiftcard = LocalizationKey(key: "plexy.card.applyGiftcard")
    /// Collection Institution Number
    public static let voucherCollectionInstitutionNumber = LocalizationKey(key: "plexy.voucher.collectionInstitutionNumber")
    /// Merchant
    public static let voucherMerchantName = LocalizationKey(key: "plexy.voucher.merchantName")
    /// Expiration Date
    public static let voucherExpirationDate = LocalizationKey(key: "plexy.voucher.expirationDate")
    /// Payment Reference
    public static let voucherPaymentReferenceLabel = LocalizationKey(key: "plexy.voucher.paymentReferenceLabel")
    /// Shopper Name
    public static let voucherShopperName = LocalizationKey(key: "plexy.voucher.shopperName")
    /// Copy
    public static let buttonCopy = LocalizationKey(key: "plexy.button.copy")
    /// Thank you for your purchase, please use the following information to complete your payment.
    public static let voucherIntroduction = LocalizationKey(key: "plexy.voucher.introduction")
    /// Read instructions
    public static let voucherReadInstructions = LocalizationKey(key: "plexy.voucher.readInstructions")
    /// Save as image
    public static let voucherSaveImage = LocalizationKey(key: "plexy.voucher.saveImage")
    /// Finish
    public static let voucherFinish = LocalizationKey(key: "plexy.voucher.finish")
    /// 123.123.123-12
    public static let cardBrazilSSNPlaceholder = LocalizationKey(key: "plexy.card.brazilSSN.placeholder")
    /// Amount
    public static let amount = LocalizationKey(key: "plexy.amount")
    /// Entity
    public static let voucherEntity = LocalizationKey(key: "plexy.voucher.entity")
    /// Open the app with the PIX registered key, choose Pay with PIX and scan the QR Code or copy and paste the code
    public static let pixInstructions = LocalizationKey(key: "plexy.pix.instructions")
    /// You have %@ to pay
    public static let pixExpirationLabel = LocalizationKey(key: "plexy.pix.expirationLabel")
    /// Copy code
    public static let pixCopyButton = LocalizationKey(key: "plexy.pix.copyButton")
    /// Code copied to clipboard
    public static let pixInstructionsCopiedMessage = LocalizationKey(key: "plexy.pix.instructions.copiedMessage")
    /// Billing address
    public static let billingAddressSectionTitle = LocalizationKey(key: "plexy.billingAddressSection.title")
    /// Your billing address
    public static let billingAddressPlaceholder = LocalizationKey(key: "plexy.billingAddress.placeholder")
    /// Delivery Address
    public static let deliveryAddressSectionTitle = LocalizationKey(key: "plexy.deliveryAddressSection.title")
    /// Your delivery address
    public static let deliveryAddressPlaceholder = LocalizationKey(key: "plexy.deliveryAddress.placeholder")
    /// Country/Region
    public static let countryFieldTitle = LocalizationKey(key: "plexy.countryField.title")
    /// Country/Region
    public static let countryFieldPlaceholder = LocalizationKey(key: "plexy.countryField.placeholder")
    /// Invalid country/region
    public static let countryFieldInvalid = LocalizationKey(key: "plexy.countryField.invalid")
    /// Address
    public static let addressFieldTitle = LocalizationKey(key: "plexy.addressField.title")
    /// Address
    public static let addressFieldPlaceholder = LocalizationKey(key: "plexy.addressField.placeholder")
    /// Street
    public static let streetFieldTitle = LocalizationKey(key: "plexy.streetField.title")
    /// Street
    public static let streetFieldPlaceholder = LocalizationKey(key: "plexy.streetField.placeholder")
    /// House number
    public static let houseNumberFieldTitle = LocalizationKey(key: "plexy.houseNumberField.title")
    /// House number
    public static let houseNumberFieldPlaceholder = LocalizationKey(key: "plexy.houseNumberField.placeholder")
    /// City
    public static let cityFieldTitle = LocalizationKey(key: "plexy.cityField.title")
    /// City
    public static let cityFieldPlaceholder = LocalizationKey(key: "plexy.cityField.placeholder")
    /// City / Town
    public static let cityTownFieldTitle = LocalizationKey(key: "plexy.cityTownField.title")
    /// City / Town
    public static let cityTownFieldPlaceholder = LocalizationKey(key: "plexy.cityTownField.placeholder")
    /// Postal code
    public static let postalCodeFieldTitle = LocalizationKey(key: "plexy.postalCodeField.title")
    /// Postal code
    public static let postalCodeFieldPlaceholder = LocalizationKey(key: "plexy.postalCodeField.placeholder")
    /// Zip code
    public static let zipCodeFieldTitle = LocalizationKey(key: "plexy.zipCodeField.title")
    /// Zip code
    public static let zipCodeFieldPlaceholder = LocalizationKey(key: "plexy.zipCodeField.placeholder")
    /// State
    public static let stateFieldTitle = LocalizationKey(key: "plexy.stateField.title")
    /// State
    public static let stateFieldPlaceholder = LocalizationKey(key: "plexy.stateField.placeholder")
    /// Select state
    public static let selectStateFieldPlaceholder = LocalizationKey(key: "plexy.selectStateField.placeholder")
    /// State or province
    public static let stateOrProvinceFieldTitle = LocalizationKey(key: "plexy.stateOrProvinceField.title")
    /// State or province
    public static let stateOrProvinceFieldPlaceholder = LocalizationKey(key: "plexy.stateOrProvinceField.placeholder")
    /// Select province or territory
    public static let selectStateOrProvinceFieldPlaceholder = LocalizationKey(key: "plexy.selectStateOrProvinceField.placeholder")
    /// Province or Territory
    public static let provinceOrTerritoryFieldTitle = LocalizationKey(key: "plexy.provinceOrTerritoryField.title")
    /// Province or Territory
    public static let provinceOrTerritoryFieldPlaceholder = LocalizationKey(key: "plexy.provinceOrTerritoryField.placeholder")
    /// Apartment / Suite
    public static let apartmentSuiteFieldTitle = LocalizationKey(key: "plexy.apartmentSuiteField.title")
    /// Apartment / Suite
    public static let apartmentSuiteFieldPlaceholder = LocalizationKey(key: "plexy.apartmentSuiteField.placeholder")
    /// Required field, please fill it in.
    public static let errorFeedbackEmptyField = LocalizationKey(key: "plexy.errorFeedback.emptyField")
    /// Input format is not valid.
    public static let errorFeedbackIncorrectFormat = LocalizationKey(key: "plexy.errorFeedback.incorrectFormat")
    /// (optional)
    public static let fieldTitleOptional = LocalizationKey(key: "plexy.field.title.optional")
    /// Generate Boleto
    public static let boletobancarioBtnLabel = LocalizationKey(key: "plexy.boletobancario.btnLabel")
    /// Send a copy to my email
    public static let boletoSendCopyToEmail = LocalizationKey(key: "plexy.boleto.sendCopyToEmail")
    /// Personal details
    public static let boletoPersonalDetails = LocalizationKey(key: "plexy.boleto.personalDetails")
    /// CPF/CNPJ
    public static let boletoSocialSecurityNumber = LocalizationKey(key: "plexy.boleto.socialSecurityNumber")
    /// Download PDF
    public static let boletoDownloadPdf = LocalizationKey(key: "plexy.boleto.download.pdf")
    /// Gift cards are only valid in the currency they were issued in
    public static let giftcardCurrencyError = LocalizationKey(key: "plexy.giftcard.currencyError")
    /// This gift card has zero balance
    public static let giftcardNoBalance = LocalizationKey(key: "plexy.giftcard.noBalance")
    /// Confirm card removal
    public static let giftcardRemoveTitle = LocalizationKey(key: "plexy.giftcard.remove.title")
    /// Remove added giftcards?
    public static let giftcardRemoveMessage = LocalizationKey(key: "plexy.giftcard.remove.message")
    /// Added giftcard
    public static let giftcardPaymentMethodTitle = LocalizationKey(key: "plexy.giftcard.paymentMethod.title")
    /// Remaining balance will be %@
    public static let partialPaymentRemainingBalance = LocalizationKey(key: "plexy.partialPayment.remainingBalance")
    /// Select payment method for the remaining %@
    public static let partialPaymentPayRemainingAmount = LocalizationKey(key: "plexy.partialPayment.payRemainingAmount")
    /// Cardholder birthdate (YYMMDD) or Corporate registration number (10 digits)
    public static let cardTaxNumberLabel = LocalizationKey(key: "plexy.card.taxNumber.label")
    /// YYMMDD / 0123456789
    public static let cardTaxNumberPlaceholder = LocalizationKey(key: "plexy.card.taxNumber.placeholder")
    /// Invalid Cardholder birthdate or Corporate registration number
    public static let cardTaxNumberInvalid = LocalizationKey(key: "plexy.card.taxNumber.invalid")
    /// First 2 digits of card password
    public static let cardEncryptedPasswordLabel = LocalizationKey(key: "plexy.card.encryptedPassword.label")
    /// 12
    public static let cardEncryptedPasswordPlaceholder = LocalizationKey(key: "plexy.card.encryptedPassword.placeholder")
    /// Invalid password
    public static let cardEncryptedPasswordInvalid = LocalizationKey(key: "plexy.card.encryptedPassword.invalid")
    /// Birthdate or Corporate registration number
    public static let cardTaxNumberLabelShort = LocalizationKey(key: "plexy.card.taxNumber.label.short")
    /// Separate delivery address
    public static let affirmDeliveryAddressToggleTitle = LocalizationKey(key: "plexy.affirm.deliveryAddressToggle.title")
    /// Shopper Reference
    public static let voucherShopperReference = LocalizationKey(key: "plexy.voucher.shopperReference")
    /// Alternative Reference
    public static let voucherAlternativeReference = LocalizationKey(key: "plexy.voucher.alternativeReference")
    /// Number of installments
    public static let cardInstallmentsNumberOfInstallments = LocalizationKey(key: "plexy.card.installments.numberOfInstallments")
    /// One time payment
    public static let cardInstallmentsOneTime = LocalizationKey(key: "plexy.card.installments.oneTime")
    /// Installments payment
    public static let cardInstallmentsTitle = LocalizationKey(key: "plexy.card.installments.title")
    /// Revolving payment
    public static let cardInstallmentsRevolving = LocalizationKey(key: "plexy.card.installments.revolving")
    /// %@x %@
    public static let cardInstallmentsMonthsAndPrice = LocalizationKey(key: "plexy.card.installments.monthsAndPrice")
    /// %@ months
    public static let cardInstallmentsMonths = LocalizationKey(key: "plexy.card.installments.months")
    /// Method of payment
    public static let cardInstallmentsPlan = LocalizationKey(key: "plexy.card.installments.plan")
    /// Bank account holder name
    public static let bacsHolderNameFieldTitle = LocalizationKey(key: "plexy.bacs.holderNameField.title")
    /// Bank account number
    public static let bacsBankAccountNumberFieldTitle = LocalizationKey(key: "plexy.bacs.bankAccountNumberField.title")
    /// Sort code
    public static let bacsBankLocationIdFieldTitle = LocalizationKey(key: "plexy.bacs.bankLocationIdField.title")
    /// I confirm the account is in my name and I am the only signatory required to authorise the Direct Debit on this account.
    public static let bacsLegalConsentToggleTitle = LocalizationKey(key: "plexy.bacs.legalConsentToggle.title")
    /// I agree that the above amount will be deducted from my bank account.
    public static let bacsAmountConsentToggleTitle = LocalizationKey(key: "plexy.bacs.amountConsentToggle.title")
    /// I agree that %@ will be deducted from my bank account.
    public static let bacsSpecifiedAmountConsentToggleTitle = LocalizationKey(key: "plexy.bacs.specifiedAmountConsentToggle.title")
    /// Invalid bank account holder name
    public static let bacsHolderNameFieldInvalidMessage = LocalizationKey(key: "plexy.bacs.holderNameField.invalidMessage")
    /// Invalid bank account number
    public static let bacsBankAccountNumberFieldInvalidMessage = LocalizationKey(key: "plexy.bacs.bankAccountNumberField.invalidMessage")
    /// Invalid sort code
    public static let bacsBankLocationIdFieldInvalidMessage = LocalizationKey(key: "plexy.bacs.bankLocationIdField.invalidMessage")
    /// Confirm and pay
    public static let bacsPaymentButtonTitle = LocalizationKey(key: "plexy.bacs.paymentButton.title")
    /// Download your Direct Debit Instruction (DDI / Mandate)
    public static let bacsDownloadMandate = LocalizationKey(key: "plexy.bacs.downloadMandate")
    /// Bank account
    public static let achBankAccountTitle = LocalizationKey(key: "plexy.ach.bankAccount.title")
    /// Account holder name
    public static let achAccountHolderNameFieldTitle = LocalizationKey(key: "plexy.ach.accountHolderNameField.title")
    /// Invalid account holder name
    public static let achAccountHolderNameFieldInvalid = LocalizationKey(key: "plexy.ach.accountHolderNameField.invalid")
    /// Account number
    public static let achAccountNumberFieldTitle = LocalizationKey(key: "plexy.ach.accountNumberField.title")
    /// Invalid account number
    public static let achAccountNumberFieldInvalid = LocalizationKey(key: "plexy.ach.accountNumberField.invalid")
    /// ABA routing number
    public static let achAccountLocationFieldTitle = LocalizationKey(key: "plexy.ach.accountLocationField.title")
    /// Invalid ABA routing number
    public static let achAccountLocationFieldInvalid = LocalizationKey(key: "plexy.ach.accountLocationField.invalid")
    /// Bank
    public static let selectFieldTitle = LocalizationKey(key: "idealIssuer.selectField.title")
    /// By continuing you agree with the #terms and conditions#
    public static let onlineBankingTermsAndConditions = LocalizationKey(key: "plexy.onlineBanking.termsAndConditions")
    /// Take a screenshot or save the QR code, open your banking application and upload the QR code to verify the details and complete the payment.
    public static let qrCodeInstructionMessage = LocalizationKey(key: "plexy.qrCode.instructionMessage")
    /// This QR code is valid for %@
    public static let qrCodeTimerExpirationMessage = LocalizationKey(key: "plexy.qrCode.timerExpirationMessage")
    /// No banks found with your search query…
    public static let paybybankSubtitle = LocalizationKey(key: "plexy.paybybank.subtitle")
    /// No results for
    public static let paybybankTitle = LocalizationKey(key: "plexy.paybybank.title")
    /// Search…
    public static let searchPlaceholder = LocalizationKey(key: "plexy.search.placeholder")
    /// Use Pay by Bank to pay instantly from any bank account.
    public static let payByBankAISDDDisclaimerHeader = LocalizationKey(key: "plexy.payByBankAISDD.disclaimer.header")
    /// By connecting your bank account you are authorizing debits to your account for any amount owed for use of our services and/or purchase of our products, until this authorization is revoked.
    public static let payByBankAISDDDisclaimerBody = LocalizationKey(key: "plexy.payByBankAISDD.disclaimer.body")
    /// Continue to Pay by Bank
    public static let payByBankAISDDSubmit = LocalizationKey(key: "plexy.payByBankAISDD.submit")
    /// + more
    public static let payByBankAISDDMore = LocalizationKey(key: "plexy.payByBankAISDD.more")
    /// How would you like to use UPI?
    public static let upiModeSelection = LocalizationKey(key: "plexy.upi.modeSelection")
    /// UPI app
    public static let upiModePayByAnyUpi = LocalizationKey(key: "plexy.upi.mode.payByAnyUpi")
    /// Select your preferred UPI app
    public static let upiIntentInstruction = LocalizationKey(key: "plexy.upi.intent.instruction")
    /// Select your preferred UPI app to continue
    public static let upiErrorNoAppSelected = LocalizationKey(key: "plexy.upi.error.noAppSelected")
    /// UPI ID
    public static let upiCollectFieldLabel = LocalizationKey(key: "plexy.upi.collect.field.label")
    /// Enter your UPI ID
    public static let upiCollectInstruction = LocalizationKey(key: "plexy.upi.collect.instruction")
    /// UPI ID
    public static let upiModeEnterUpiId = LocalizationKey(key: "plexy.upi.mode.enterUpiId")
    /// Enter a valid UPI
    public static let upiCollectFieldInvalidIdError = LocalizationKey(key: "plexy.upi.collect.field.invalidIdError")
    /// Awaiting your confirmation…
    public static let upiCollectConfirmPayment = LocalizationKey(key: "plexy.upi.collect.confirmPayment")
    /// Open your UPI app to confirm the payment
    public static let upiVpaWaitingMessage = LocalizationKey(key: "plexy.upi.vpaWaitingMessage")
    /// You have %@ to approve
    public static let upiQrcodeTimerMessage = LocalizationKey(key: "plexy.upi.qrcode.timerMessage")
    /// Take a screenshot to upload in the UPI app or scan the QR code using your preferred UPI app to complete the payment.
    public static let upiQrcodeInstructions = LocalizationKey(key: "plexy.upi.qrcode.instructions")
    /// Cash App Pay
    public static let cashAppPayTitle = LocalizationKey(key: "plexy.cashAppPay.title")
    /// Cashtag
    public static let cashAppPayCashtag = LocalizationKey(key: "plexy.cashAppPay.cashtag")
    /// No or an outdated version of TWINT is installed on this device. Please update or install the TWINT app.
    public static let twintNoAppsInstalledMessage = LocalizationKey(key: "plexy.twint.noAppsInstalled.message")
    /// Secure checkout
    public static let threeds2DARegistrationTitle = LocalizationKey(key: "plexy.threeds2.DA.registration.title")
    /// biometric
    public static let threeds2DABiometrics = LocalizationKey(key: "plexy.threeds2.DA.biometrics")
    /// Face ID
    public static let threeds2DAFaceID = LocalizationKey(key: "plexy.threeds2.DA.faceID")
    /// Touch ID
    public static let threeds2DATouchID = LocalizationKey(key: "plexy.threeds2.DA.touchID")
    /// Optic ID
    public static let threeds2DAOpticID = LocalizationKey(key: "plexy.threeds2.DA.opticID")
    /// Check out faster next time with this card
    public static let threeds2DARegistrationDescription = LocalizationKey(key: "plexy.threeds2.DA.registration.description")
    /// Skip manual entry & speed up checkout
    public static let threeds2DARegistrationFirstInfo = LocalizationKey(key: "plexy.threeds2.DA.registration.firstInfo")
    /// Pay with %@ or passcode
    public static let threeds2DARegistrationSecondInfo = LocalizationKey(key: "plexy.threeds2.DA.registration.secondInfo")
    /// Edit or remove your details at any time
    public static let threeds2DARegistrationThirdInfo = LocalizationKey(key: "plexy.threeds2.DA.registration.thirdInfo")
    /// Use secure checkout
    public static let threeds2DARegistrationPositiveButton = LocalizationKey(key: "plexy.threeds2.DA.registration.positiveButton")
    /// Not now
    public static let threeds2DARegistrationNegativeButton = LocalizationKey(key: "plexy.threeds2.DA.registration.negativeButton")
    /// Approve transaction
    public static let threeds2DAApprovalTitle = LocalizationKey(key: "plexy.threeds2.DA.approval.title")
    /// Approve this transaction to complete your purchase.
    public static let threeds2DAApprovalDescription = LocalizationKey(key: "plexy.threeds2.DA.approval.description")
    /// Approve transaction
    public static let threeds2DAApprovalPositiveButton = LocalizationKey(key: "plexy.threeds2.DA.approval.positiveButton")
    /// Other options
    public static let threeds2DAApprovalNegativeButton = LocalizationKey(key: "plexy.threeds2.DA.approval.negativeButton")
    /// Other options
    public static let threeds2DAApprovalActionSheetTitle = LocalizationKey(key: "plexy.threeds2.DA.approval.actionSheet.title")
    /// Approve differently
    public static let threeds2DAApprovalActionSheetFallback = LocalizationKey(key: "plexy.threeds2.DA.approval.actionSheet.fallback")
    /// Remove my credentials
    public static let threeds2DAApprovalActionSheetRemove = LocalizationKey(key: "plexy.threeds2.DA.approval.actionSheet.remove")
    /// Remove credentials
    public static let threeds2DAApprovalRemoveAlertTitle = LocalizationKey(key: "plexy.threeds2.DA.approval.remove.alert.title")
    /// Are you sure you want to remove your Secure Checkout credentials?
    public static let threeds2DAApprovalRemoveAlertDescription = LocalizationKey(key: "plexy.threeds2.DA.approval.remove.alert.description")
    /// Remove
    public static let threeds2DAApprovalRemoveAlertPositiveButton = LocalizationKey(key: "plexy.threeds2.DA.approval.remove.alert.positiveButton")
    /// Cancel
    public static let threeds2DAApprovalRemoveAlertNegativeButton = LocalizationKey(key: "plexy.threeds2.DA.approval.remove.alert.negativeButton")
    /// Troubleshooting
    public static let threeds2DAErrorTroubleshootingTitle = LocalizationKey(key: "plexy.threeds2.DA.error.troubleshootingTitle")
    /// Ongoing payment issues may be resolved by resetting your Secure Checkout details.
    public static let threeds2DAErrorTroubleshootingDescription = LocalizationKey(key: "plexy.threeds2.DA.error.troubleshootingDescription")
    /// Reset Secure Checkout
    public static let threeds2DAErrorTroubleshootingButtonTitle = LocalizationKey(key: "plexy.threeds2.DA.error.troubleshootingButtonTitle")
    /// Reset Secure Checkout
    public static let threeds2DAErrorResetAlertTitle = LocalizationKey(key: "plexy.threeds2.DA.error.reset.alert.title")
    /// You will be redirected to complete this payment in a different way.
    public static let threeds2DAErrorResetAlertDescription = LocalizationKey(key: "plexy.threeds2.DA.error.reset.alert.description")
    /// Reset
    public static let threeds2DAErrorResetAlertPositiveButton = LocalizationKey(key: "plexy.threeds2.DA.error.reset.alert.positiveButton")
    /// Cancel
    public static let threeds2DAErrorResetAlertNegativeButton = LocalizationKey(key: "plexy.threeds2.DA.error.reset.alert.negativeButton")
    /// Authenticating…
    public static let threeds2DAApprovalErrorTitle = LocalizationKey(key: "plexy.threeds2.DA.approval.error.title")
    /// Couldn’t approve payment with Secure Checkout
    public static let threeds2DAApprovalErrorMessage = LocalizationKey(key: "plexy.threeds2.DA.approval.error.message")
    /// Approve differently
    public static let threeds2DAApprovalErrorButtonTitle = LocalizationKey(key: "plexy.threeds2.DA.approval.error.buttonTitle")
    /// Let’s try next time!
    public static let threeds2DARegistrationErrorTitle = LocalizationKey(key: "plexy.threeds2.DA.registration.error.title")
    /// Your payment has still been authenticated successfully but the Secure Checkout service was unavailable.
    public static let threeds2DARegistrationErrorMessage = LocalizationKey(key: "plexy.threeds2.DA.registration.error.message")
    /// Finish
    public static let threeds2DARegistrationErrorButtonTitle = LocalizationKey(key: "plexy.threeds2.DA.registration.error.buttonTitle")
    /// Credentials removed
    public static let threeds2DADeletionConfirmationTitle = LocalizationKey(key: "plexy.threeds2.DA.deletion.confirmation.title")
    /// You will no longer be asked to approve transactions through Secure Checkout.
    public static let threeds2DADeletionConfirmationMessage = LocalizationKey(key: "plexy.threeds2.DA.deletion.confirmation.message")
    /// Continue
    public static let threeds2DADeletionConfirmationButtonTitle = LocalizationKey(key: "plexy.threeds2.DA.deletion.confirmation.buttonTitle")
    /// No results found
    public static let pickerSearchEmptyTitle = LocalizationKey(key: "plexy.picker.search.empty.title")
    /// '%@' did not match with anything
    public static let pickerSearchEmptySubtitle = LocalizationKey(key: "plexy.picker.search.empty.subtitle")
    /// Search for your address
    public static let addressLookupSearchPlaceholder = LocalizationKey(key: "plexy.address.lookup.search.placeholder")
    /// Can't search for your address?
    public static let addressLookupSearchEmptyTitle = LocalizationKey(key: "plexy.address.lookup.search.empty.title")
    /// You can always #enter your address manually#
    public static let addressLookupSearchEmptySubtitle = LocalizationKey(key: "plexy.address.lookup.search.empty.subtitle")
    /// No results found
    public static let addressLookupSearchEmptyTitleNoResults = LocalizationKey(key: "plexy.address.lookup.search.empty.title.noResults")
    /// '%@' did not match with anything, try again or use #manual address entry#
    public static let addressLookupSearchEmptySubtitleNoResults = LocalizationKey(key: "plexy.address.lookup.search.empty.subtitle.noResults")
    /// Address required
    public static let addressLookupItemValidationFailureMessageEmpty = LocalizationKey(key: "plexy.address.lookup.item.validationFailureMessage.empty")
    /// Invalid Address
    public static let addressLookupItemValidationFailureMessageInvalid = LocalizationKey(key: "plexy.address.lookup.item.validationFailureMessage.invalid")
    /// Enter address manually
    public static let addressLookupSearchManualEntryItemTitle = LocalizationKey(key: "plexy.address.lookup.search.manualEntryItem.title")
    /// Last 4 digits
    public static let accessibilityLastFourDigits = LocalizationKey(key: "plexy.accessibility.lastFourDigits")
    /// How would you like to use PayTo?
    public static let paytoModeSelection = LocalizationKey(key: "plexy.payto.mode.selection")
    /// Mobile number
    public static let mobileNumber = LocalizationKey(key: "plexy.mobileNumber")
    /// Mobile
    public static let paytoPayidOptionPhone = LocalizationKey(key: "plexy.payto.payid.option.phone")
    /// Account holder first name
    public static let paytoLabelFirstName = LocalizationKey(key: "plexy.payto.label.firstName")
    /// Account holder last name
    public static let paytoLabelLastName = LocalizationKey(key: "plexy.payto.label.lastName")
    /// Identifier
    public static let paytoPayidLabelIdentifier = LocalizationKey(key: "plexy.payto.payid.label.identifier")
    /// Australian Business Number
    public static let paytoPayidAbnHint = LocalizationKey(key: "plexy.payto.payid.abn.hint")
    /// Organization ID
    public static let paytoPayidLabelOrgid = LocalizationKey(key: "plexy.payto.payid.label.orgid")
    /// Organization ID number
    public static let paytoPayidOrgidHint = LocalizationKey(key: "plexy.payto.payid.orgid.hint")
    /// Bank account number
    public static let paytoBsbLabelBankAccountNumber = LocalizationKey(key: "plexy.payto.bsb.label.bankAccountNumber")
    /// Bank state branch
    public static let paytoBsbBankStateBranchHint = LocalizationKey(key: "plexy.payto.bsb.bankStateBranch.hint")
    /// Enter the bank account number and the Bank State Branch that is connected to your account to continue
    public static let paytoBsbDescription = LocalizationKey(key: "plexy.payto.bsb.description")
    /// Mobile phone
    public static let paytoPayidPhoneHint = LocalizationKey(key: "plexy.payto.payid.phone.hint")
    /// Email
    public static let paytoPayidOptionEmail = LocalizationKey(key: "plexy.payto.payid.option.email")
    /// Enter a correct first name
    public static let paytoFirstNameInvalid = LocalizationKey(key: "plexy.payto.firstName.invalid")
    /// Enter a correct last name
    public static let paytoLastNameInvalid = LocalizationKey(key: "plexy.payto.lastName.invalid")
    /// Enter a correct Australian Business Number
    public static let paytoPayidAbnInvalid = LocalizationKey(key: "plexy.payto.payid.abn.invalid")
    /// Enter a correct organization ID number
    public static let paytoPayidOrgidInvalid = LocalizationKey(key: "plexy.payto.payid.orgid.invalid")
    /// Enter a correct email address
    public static let paytoPayidEmailInvalid = LocalizationKey(key: "plexy.payto.payid.email.invalid")
    /// Enter a correct Bank State Branch
    public static let paytoBsbBankStateBranchInvalid = LocalizationKey(key: "plexy.payto.bsb.bankStateBranch.invalid")
    /// Enter a correct bank account number
    public static let paytoBsbBankAccountNumberInvalid = LocalizationKey(key: "plexy.payto.bsb.bankAccountNumber.invalid")
    /// Enter the PayID and account details that are connected to your PayTo account.
    public static let paytoPayidDescription = LocalizationKey(key: "plexy.payto.payid.description")
    /// Thank you for your purchase, complete your payment by logging into you bank account, authorize the PayTo agreement and approve the payment terms.
    public static let paytoAwaitDescription = LocalizationKey(key: "plexy.payto.await.description")
    /// Allow camera access
    public static let cardScannerCameraAccessDeniedAlertTitle = LocalizationKey(key: "plexy.card.scanner.camera.access.denied.alert.title")
    /// Access was previously denied. To scan cards, please grant access from Settings.
    public static let cardScannerCameraAccessDeniedAlertMessage = LocalizationKey(key: "plexy.card.scanner.camera.access.denied.alert.message")
    /// Open Settings
    public static let cardScannerCameraAccessDeniedAlertSettingsButtonTitle = LocalizationKey(key: "plexy.card.scanner.camera.access.denied.alert.settingsButton.title")
    
    internal let key: String
    
    /// :nodoc:
    public init(key: String) {
        self.key = key
    }

}

// swiftlint:enable all
