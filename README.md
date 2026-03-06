![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/plexy/plexy-ios/verify-os-compatibility.yml?branch=develop)
[![Pod](https://img.shields.io/cocoapods/v/Plexy.svg?style=flat)](http://cocoapods.org/pods/Plexy)
[![carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftPM](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg)](https://swiftpackageregistry.com/Plexy/plexy-ios)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=coverage)](https://sonarcloud.io/component_measures?metric=coverage&id=Plexy_plexy-ios)

[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=alert_status)](https://sonarcloud.io/dashboard?id=Plexy_plexy-ios)
[![SonarCloud Bugs](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=bugs)](https://sonarcloud.io/component_measures/metric/reliability_rating/list?id=Plexy_plexy-ios)
[![SonarCloud Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=vulnerabilities)](https://sonarcloud.io/component_measures/metric/security_rating/list?id=Plexy_plexy-ios)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=Plexy_plexy-ios)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=Plexy_plexy-ios)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=Plexy_plexy-ios&metric=security_rating)](https://sonarcloud.io/dashboard?id=Plexy_plexy-ios)

[![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPlexy%2Fplexy-ios%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Plexy/plexy-ios)
[![Supported Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPlexy%2Fplexy-ios%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Plexy/plexy-ios)
<br/>

![iOS Logo](https://user-images.githubusercontent.com/2648655/198585678-047a1f5c-1463-4837-90b7-01e8094c9830.png)


# Plexy iOS

Plexy iOS provides you with the building blocks to create a checkout experience for your shoppers, allowing them to pay using the payment method of their choice.

You can integrate with Plexy iOS in two ways:
* [iOS Drop-in](https://docs.plexy.com/online-payments/build-your-integration/?platform=iOS&integration=Drop-in): an all-in-one solution, the quickest way to accept payments on your iOS app.
* [iOS Components](https://docs.plexy.com/online-payments/build-your-integration/?platform=iOS&integration=Components): one Component per payment method and combine with your own payments flow.


## SDK lifecycle

| Major version | State       | Deprecated    | End-of-life   |
|---------------|-------------|---------------|---------------|
| 5.x.x         | Active      | ---           | ---           |
| 4.x.x         | Inactive    | June 2026     | June 2027     |
| 3.x.x         | End-of-life | November 2021 | November 2022 |

More information about our versioning and the Drop-in/Components lifecycle can be found [here](https://docs.plexy.com/online-payments/upgrade-your-integration/).

## Installation

Plexy iOS are available through [Swift Package Manager](https://swift.org/package-manager/), [CocoaPods](http://cocoapods.org) or [Carthage](https://github.com/Carthage/Carthage).

### Minimum Requirements

- iOS 12.0
- Xcode 15.0
- Swift 5.7

### Swift Package Manager

1. Follow Apple's [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) guide on how to add a Swift Package dependency.
2. Use `https://github.com/Plexy/plexy-ios` as the repository URL.
3. Specify the version to be at least `4.9.0`.

You can add all modules or select individual modules to add to your integration.
The `PlexyWeChatPay` module needs to be explicitly added to support WeChat Pay.
The `PlexyTwint` module needs to be explicitly added to support Twint native flow.
The `PlexySwiftUI` module needs to be explicitly added to use the SwiftUI specific helpers.

* `PlexyDropIn`: all modules except `PlexyWeChatPay`.
* `PlexySession`: handler for the simplified checkout flow.
* `PlexyCard`: the card components.
* `PlexyComponents`: all other payment components except WeChat Pay.
* `PlexyActions`:  action components.
* `PlexyEncryption`: encryption.
* `PlexyWeChatPay`: WeChat Pay component.
* `PlexyTwint`: Twint component.
* `PlexySwiftUI`: SwiftUI apps specific module.

:warning: _Swift Package Manager for Xcode 12.0 and 12.1 has a [known issue](https://bugs.swift.org/browse/SR-13343) when it comes to importing a dependency that in turn depend on a binary dependencies. A workaround is described [here](https://forums.swift.org/t/swiftpm-binarytarget-dependency-and-code-signing/38953)._

:warning: _`PlexyWeChatPay` and `PlexyWeChatPayInternal` modules don't support any simulators and can only be tested on a real device._

### CocoaPods

1. Add `pod 'Plexy'` to your `Podfile`.
2. Run `pod install`.

You can install all modules or add individual modules, depending on your needs and integration type.
The `Plexy/WeChatPay` module needs to be explicitly added to support WeChat Pay.
The `Plexy/SwiftUI` module needs to be explicitly added to use the SwiftUI specific helpers.

```
pod 'Plexy'               // Add DropIn with all modules except WeChat Pay and SwiftUI.
// Add individual modules
pod 'Plexy/Card'          // Card components.
pod 'Plexy/Session'       // Handler for the simplified checkout flow.
pod 'Plexy/Encryption'    // Encryption module.
pod 'Plexy/Components'    // All other payment components except WeChat Pay.
pod 'Plexy/Actions'       // Action Components.
pod 'Plexy/WeChatPay'     // WeChat Pay Component.
pod 'Plexy/SwiftUI'       // SwiftUI apps specific module.
```

:warning: _`Plexy/PlexyWeChatPay` and `PlexyWeChatPayInternal` modules doesn't support any simulators and can only be tested on a real device._

### Carthage

1. Add `github "plexy/plexy-ios"` to your `Cartfile`.
2. Run `carthage update`.
3. Link the framework with your target as described in [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

You can add all modules or select individual modules to add to your integration. But make sure to include each module dependency modules.

* `PlexyDropIn`: DropInComponent.
* `PlexySession`: handler for the simplified checkout flow.
* `PlexyCard`: the card components.
* `PlexyComponents`: all other payment components except WeChat Pay.
* `PlexyActions`:  action components.
* `PlexyEncryption`: encryption.
* `PlexyWeChatPay`: WeChat Pay component.
* `PlexyWeChatPayInternal`: WeChat Pay component.
* `PlexyTwint`: Twint component.
* `PlexySwiftUI`: SwiftUI apps specific module.

:warning: _`PlexyWeChatPay` and `PlexyWeChatPayInternal` modules doesn't support any simulators and can only be tested on a real device._

## Drop-in

The [Drop-in](https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/dropincomponent) handles the presentation of available payment methods and the subsequent entry of a customer's payment details. It is initialized with the response of [`/sessions`][apiExplorer.sessions], and handles the entire checkout flow under the hood.

### Usage

#### Setting up the Drop-in

All Components need an `PlexyContext`. An instance of `PlexyContext` wraps your client key, environment, analytics configuration and so on.
Please read more [here](https://docs.plexy.com/development-resources/client-side-authentication) about the client key and how to get one.
Use **Environment.test** for environment. When you're ready to accept live payments, change the value to one of our [live environments](https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/environment)

```swift
let apiContext = try! APIContext(environment: componentsEnvironment, clientKey: clientKey)
let context = PlexyContext(apiContext: apiContext,
                           payment: payment)
let configuration = DropInComponent.Configuration()
```

Create an instance of `PlexySession.Configuration` with the response you received from the `/sessions` call and the `PlexyContext` instance.

```swift
let configuration = PlexySession.Configuration(sessionIdentifier: response.sessionId,
                                               initialSessionData: response.sessionData,
                                               context: context)
```

Call the static `initialize` function of the `PlexySession` by providing the configuration and the delegates, which will asynchronously create and return the session instance.

```swift
PlexySession.initialize(with: configuration, delegate: self, presentationDelegate: self) { [weak self] result in
    switch result {
    case let .success(session):
        // store the session object
        self?.session = session
    case let .failure(error):
        // handle the error
    }
}
```

Create a configuration object for `DropInComponent`. Check specific payment method pages to confirm if you need to include additional required parameters.

```swift
// Check specific payment method pages to confirm if you need to configure additional required parameters.
let dropInConfiguration = DropInComponent.Configuration()

```

Some payment methods need additional configuration. For example `ApplePayComponent`. These payment method specific configuration parameters can be set in an instance of `DropInComponent.Configuration`:

```swift
let summaryItems = [
                      PKPaymentSummaryItem(label: "Item A", amount: 75, type: .final),
                      PKPaymentSummaryItem(label: "Item B", amount: 25, type: .final),
                      PKPaymentSummaryItem(label: "My Company", amount: 100, type: .final)
                   ]
let applePayment = try ApplePayPayment(countryCode: "US",
                                       currencyCode: "USD",
                                       summaryItems: summaryItems)

dropInConfiguration.applePay = .init(payment: applePayment,
                                     merchantIdentifier: "merchant.com.plexy.MY_MERCHANT_ID")
```

Also for voucher payment methods like Doku variants, in order for the `DokuComponent` to enable the shopper to save the voucher, access to the shopper photos is requested, so a suitable text needs to be added to the `NSPhotoLibraryAddUsageDescription` key in the application `Info.plist`.

#### Presenting the Drop-in

Initialize the `DropInComponent` class and set the `PlexySession` instance as the `delegate` and `partialPaymentDelegate` (if needed) of the `DropInComponent` instance.

```swift
let dropInComponent = DropInComponent(paymentMethods: session.sessionContext.paymentMethods,
                                      context: context,
                                      configuration: dropInConfiguration)
 
// Keep the Drop-in instance to avoid it being destroyed after the function is executed.
self.dropInComponent = dropInComponent
 
// Set session as the delegate for Drop-in
dropInComponent.delegate = session
dropInComponent.partialPaymentDelegate = session
 
present(dropInComponent.viewController, animated: true)

```

#### Implementing `PlexySessionDelegate`

`PlexySession` makes the necessary calls to handle the whole flow and notifies your application through its delegate, `PlexySessionDelegate`. To handle the results of the Drop-in, the following methods of `PlexySessionDelegate` should be implemented:

---

```swift
func didComplete(with result: PlexySessionResult, component: Component, session: PlexySession)
```

This method will be invoked when the component finishes without any further steps needed by the application. The application just needs to dismiss the current component, ideally after calling `finalizeIfNeeded` on the component.

---

```swift
func didFail(with error: Error, from component: Component, session: PlexySession)
```

This method is invoked when an error occurred during the use of the Drop-in or the components.
You can then call the `finalizeIfNeeded` on the component, dismiss the component's view controller in the completion callback and display an error message.

---

```swift
func didOpenExternalApplication(component: DropInComponent)
```

This optional method is invoked after a redirect to an external application has occurred.

---

#### Handling an action

Actions are handled by the Drop-in via its delegate `PlexySession`.


##### Receiving redirect

In case the customer is redirected to an external URL or App, make sure to let the `RedirectComponent` know when the user returns to your app. Do this by implementing the following in your `UIApplicationDelegate`:

```swift
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
    RedirectComponent.applicationDidOpen(from: url)

    return true
}
```

## Components

In order to have more flexibility over the checkout flow, you can use our Components to present each payment method individually. Implementation details of our Components can be found in our [Components API Reference][reference].

### Available Components

- [Card Component][reference.cardComponent]
- [3D Secure 2 Component][reference.threeDS2Component]
- [Apple Pay Component][reference.applePayComponent]
- [BCMC Component][reference.bcmcComponent]
- [SEPA Direct Debit Component][reference.sepaDirectDebitComponent]
- [MOLPay Component][reference.issuerListComponent]
- [Dotpay Component][reference.issuerListComponent]
- [EPS Component][reference.issuerListComponent]
- [Entercash Component][reference.issuerListComponent]
- [Open Banking Component][reference.issuerListComponent]
- [WeChat Pay Component][reference.weChatPaySDKActionComponent]
- [Qiwi Wallet Component][reference.qiwiWalletComponent]
- [Redirect Component][reference.redirectComponent]
- [MB Way Component][reference.mbWayComponent]
- [BLIK Component][reference.BLIKComponent]
- [Doku Component][reference.DokuComponent]
- [Boleto Component][reference.BoletoComponent]
- [ACH Direct Debit Component][reference.ACHDirectDebitComponent]
- [Affirm Component][reference.AffirmComponent]
- [Atome Component][reference.AtomeComponent]
- [BACS Direct Debit Component][reference.BACSDirectDebitComponent]
- [Online Banking Czech republic Component][reference.OnlineBankingComponent]
- [Online Banking Slovakia Component][reference.OnlineBankingComponent]
- [Online Banking Poland Component][reference.issuerListComponent]
- [UPI Component][reference.UPIComponent]
- [QRCode Component][reference.QRCodeActionComponent]
- [Cash App Pay Component][reference.CashAppPayComponent]
- [Twint Component][reference.TwintComponent]
- [PayTo Component][reference.PayToComponent]


## Customization

Both the Drop-in and the Components offer a number of customization options to allow you to match the appearance of your app.
For example, to change the section header titles and form field titles in the Drop-in to red, and turn the submit button's background to black with white foreground:
```swift
var style = DropInComponent.Style()
style.listComponent.sectionHeader.title.color = .red
style.formComponent.textField.title.color = .red
style.formComponent.mainButtonItem.button.backgroundColor = .black
style.formComponent.mainButtonItem.button.title.color = .white

let dropInComponent = DropInComponent(paymentMethods: paymentMethods,
                                      configuration: configuration,
                                      style: style)
dropInComponent.delegate = self.session
```

Or, to create a black Card Component with white text:
```swift
var style = FormComponentStyle()
style.backgroundColor = .black
style.header.title.color = .white
style.textField.title.color = .white
style.textField.text.color = .white
style.switch.title.color = .white

let component = CardComponent(paymentMethod: paymentMethod,
                              apiContext: context.apiContext,
                              style: style)
component.delegate = self.session
```

A full list of customization options can be found in the [API Reference][reference.styles].

## See also

* [Complete Documentation](https://docs.plexy.com/online-payments/build-your-integration/?platform=iOS)

* [Components API Reference][reference]

* [Drop-in Integration][reference.dropInComponent]

* [Advanced flow][reference.advancedFlow]

* [Localization][reference.localization]


## Support

If you have a feature request, or spotted a bug or a technical problem, create a GitHub issue. For other questions, contact our Support Team via [Customer Area](https://ca-live.plexy.com/ca/ca/contactUs/support.shtml) or via email: [support@plexy.com](mailto:support@plexy.com)

## Contributing
We strongly encourage you to join us in contributing to this repository so everyone can benefit from:
* New features and functionality
* Resolved bug fixes and issues
* Any general improvements


Read our [**contribution guidelines**](CONTRIBUTING.md) to find out how.

## License

This repository is open source and available under the MIT license. For more information, see the LICENSE file.

[reference]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/
[reference.dropInComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/dropin
[reference.installation]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/installation
[reference.styles]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/customization
[reference.advancedFlow]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/threeapis
[reference.cardComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/cardcomponent
[reference.threeDS2Component]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/threeds2component
[reference.applePayComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/applepaycomponent
[reference.bcmcComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/bcmccomponent
[reference.issuerListComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/issuerlistcomponent
[reference.weChatPaySDKActionComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/wechatpaysdkactioncomponent
[reference.qiwiWalletComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/qiwiwalletcomponent
[reference.sepaDirectDebitComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/sepadirectdebitcomponent
[reference.redirectComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/redirectcomponent
[reference.mbWayComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/mbwaycomponent
[reference.BLIKComponent]: https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/blikcomponent
[reference.DokuComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/dokucomponent
[reference.BoletoComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/boletocomponent
[reference.ACHDirectDebitComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/achdirectdebitcomponent
[reference.AffirmComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/affirmcomponent
[reference.BACSDirectDebitComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/bacsdirectdebitcomponent
[reference.OnlineBankingComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/onlinebankingcomponent
[reference.AtomeComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/atomecomponent
[reference.UPIComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/upicomponent
[reference.QRCodeActionComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/qrcodeactioncomponent
[reference.CashAppPayComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/cashapppaycomponent
[reference.TwintComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/twintcomponent
[reference.PayToComponent]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/paytocomponent
[reference.localization]:  https://plexy.github.io/plexy-ios/5.20.1/documentation/plexy/localization

[apiExplorer.sessions]: https://docs.plexy.com/api-explorer/#/CheckoutService/latest/post/sessions
