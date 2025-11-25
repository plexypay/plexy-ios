// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plexy",
    defaultLocalization: "en-us",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Plexy",
            targets: ["Plexy"]
        ),
        .library(
            name: "PlexyEncryption",
            targets: ["PlexyEncryption"]
        ),
        .library(
            name: "PlexySwiftUI",
            targets: ["PlexySwiftUI"]
        ),
        .library(
            name: "PlexyActions",
            targets: ["PlexyActions"]
        ),
        .library(
            name: "PlexyCard",
            targets: ["PlexyCard"]
        ),
        .library(
            name: "PlexyCardScanner",
            targets: ["PlexyCardScanner"]
        ),
        .library(
            name: "PlexyComponents",
            targets: ["PlexyComponents"]
        ),
        .library(
            name: "PlexySession",
            targets: ["PlexySession"]
        ),
        .library(
            name: "PlexyDropIn",
            targets: ["PlexyDropIn"]
        ),
        .library(
            name: "PlexyWeChatPay",
            targets: ["PlexyWeChatPay"]
        ),
        .library(
            name: "PlexyCashAppPay",
            targets: ["PlexyCashAppPay"]
        ),
        .library(
            name: "PlexyTwint",
            targets: ["PlexyTwint"]
        ),
        .library(
            name: "PlexyDelegatedAuthentication",
            targets: ["PlexyDelegatedAuthentication"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/plexypay/plexy-3ds2-ios",
            exact: "2.4.3"
        ),
        .package(
            url: "https://github.com/plexypay/plexy-authentication-ios",
            exact: "3.1.0"
        ),
        .package(
            url: "https://github.com/plexypay/plexy-networking-ios",
            exact: "3.0.1"
        ),
        .package(
            url: "https://github.com/plexypay/plexy-wechatpay-ios",
            exact: "2.2.0"
        ),
        .package(
            url: "https://github.com/cashapp/cash-app-pay-ios-sdk",
            exact: "0.6.2"
        )
    ],
    targets: [
        .target(
            name: "Plexy",
            dependencies: [.product(name: "PlexyNetworking", package: "plexy-networking-ios")],
            path: "Plexy",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ],
            resources: [.process("PrivacyInfo.xcprivacy")]
        ),
        .target(
            name: "PlexyEncryption",
            path: "PlexyEncryption",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexySwiftUI",
            dependencies: [],
            path: "PlexySwiftUI",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexyActions",
            dependencies: [
                .target(name: "Plexy"),
                .product(name: "Plexy3DS2", package: "plexy-3ds2-ios")
            ],
            path: "PlexyActions",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ]
        ),
        .target(
            name: "PlexyCard",
            dependencies: [
                .target(name: "Plexy"),
                .target(name: "PlexyEncryption")
            ],
            path: "PlexyCard",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ]
        ),
        .target(
            name: "PlexyCardScanner",
            path: "PlexyCardScanner",
            exclude: [
                "Info.plist"
            ]
        ),
        .target(
            name: "PlexyComponents",
            dependencies: [
                .target(name: "Plexy"),
                .target(name: "PlexyEncryption")
            ],
            path: "PlexyComponents",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexySession",
            dependencies: [
                .target(name: "Plexy"),
                .target(name: "PlexyActions")
            ],
            path: "PlexySession",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexyDropIn",
            dependencies: [
                .target(name: "PlexyCard"),
                .target(name: "PlexyComponents"),
                .target(name: "PlexyActions")
            ],
            path: "PlexyDropIn",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexyWeChatPay",
            dependencies: [
                .product(name: "PlexyWeChatPayInternal", package: "plexy-wechatpay-ios"),
                .target(name: "PlexyActions")
            ],
            path: "PlexyWeChatPay/WeChatPayActionComponent"
        ),
        .target(
            name: "PlexyCashAppPay",
            dependencies: [
                .target(name: "Plexy"),
                .product(name: "PayKit", package: "cash-app-pay-ios-sdk"),
                .product(name: "PayKitUI", package: "cash-app-pay-ios-sdk")
            ],
            path: "PlexyCashAppPay",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "PlexyTwint",
            dependencies: [
                .target(name: "Plexy"),
                .target(name: "TwintSDK")
            ],
            path: "PlexyTwint",
            exclude: ["Info.plist"]
        ),
        .binaryTarget(
            name: "TwintSDK",
            path: "XCFramework/Dynamic/TwintSDK.xcframework"
        ),
        .target(
            name: "PlexyDelegatedAuthentication",
            dependencies: [.product(name: "PlexyAuthentication", package: "plexy-authentication-ios")],
            path: "PlexyDelegatedAuthentication",
            exclude: ["Info.plist"]
        )
    ]
)
