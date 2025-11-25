# Installation

Plexy Components for iOS are available through either CocoaPods, Carthage or Swift Package Manager.

### Minimum Requirements

- iOS 12.0
- Xcode 14.0
- Swift 5.7

@TabNavigator {
    @Tab(SPM) {
        1. Follow Apple's [Adding Package Dependencies to Your App](
        https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
        ) guide on how to add a Swift Package dependency.
        2. Use `https://github.com/plexypay/plexy-ios` as the repository URL.
        3. Specify the version to be at least `4.9.0`.

        You can add all modules or select individual modules to add to your integration.
        The `PlexyWeChatPay` module needs to be explicitly added to support WeChat Pay.
        The `PlexySwiftUI` module needs to be explicitly added to use the SwiftUI specific helpers.

        * `PlexyDropIn`: all modules except `PlexyWeChatPay` `PlexyCashAppPay`, `PlexySwiftUI` and `PlexySession`.
        * `PlexySession`: handler for the simplified checkout flow.
        * `PlexyCard`: the card components.
        * `PlexyComponents`: all other payment components except WeChat Pay.
        * `PlexyActions`:  action components.
        * `PlexyEncryption`: encryption.
        * `PlexyWeChatPay`: WeChat Pay component.
        * `PlexyCashAppPay`: Cash App Pay component.
        * `PlexySwiftUI`: SwiftUI apps specific module.
        
        > important: Swift Package Manager for Xcode 12.0 and 12.1 have a [know issue](https://bugs.swift.org/browse/SR-13343) when importing dependencies that depend on binary dependencies. A workaround is described [here](https://forums.swift.org/t/swiftpm-binarytarget-dependency-and-code-signing/38953).
    }
    
    @Tab(CocoaPods) {
        1. Add `pod 'Plexy'` to your `Podfile`.
        2. Run `pod install`.

        You can install all modules or add individual modules, depending on your needs and integration type.
        The `Plexy/WeChatPay` module needs to be explicitly added to support WeChat Pay.
        The `Plexy/CashAppPay` module needs to be explicitly added to support Cash App Pay.
        The `Plexy/SwiftUI` module needs to be explicitly added to use the SwiftUI specific helpers.

        ```
        pod 'Plexy'               // Add DropIn with all modules except WeChat Pay, Cash App Pay, SwiftUI and Session.
        // Add individual modules
        pod 'Plexy/Session'       // For the new Sessions integration.
        pod 'Plexy/Card'          // Card components.
        pod 'Plexy/Encryption'    // Encryption module.
        pod 'Plexy/Components'    // All other payment components except WeChat Pay.
        pod 'Plexy/Actions'       // Action Components.
        pod 'Plexy/WeChatPay'     // WeChat Pay Component.
        pod 'Plexy/CashAppPay'    // Cash App Pay Component.
        pod 'Plexy/SwiftUI'       // SwiftUI apps specific module.
        ```
    }
    
    @Tab(Carthage) {
        1. Add `github "plexy/plexy-ios"` to your `Cartfile`.
        2. Run `carthage update`.
        3. Link the framework with your target as described in [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

        You can add all modules or select individual modules to add to your integration. But make sure to include each module dependency modules.

        * `PlexyDropIn`: DropInComponent.
        * `PlexySession`: For the new, simplified checkout flow.
        * `PlexyCard`: the card components.
        * `PlexyComponents`: all other payment components except WeChat Pay.
        * `PlexyActions`:  action components.
        * `PlexyEncryption`: encryption.
        * `PlexyWeChatPay`: WeChat Pay component.
        * `PlexyWeChatPayInternal`: WeChat Pay component.
        * `PlexySwiftUI`: SwiftUI apps specific module.
    }
}

> note: `PlexyWeChatPay` and `PlexyWeChatPayInternal` modules don't support any simulators and can only be tested on a real device.
