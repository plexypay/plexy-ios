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
            name: "PlexyNetworking",
            targets: ["PlexyNetworking"]
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
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PlexyNetworking",
            path: "PlexyNetworking",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "Plexy",
            dependencies: [.target(name: "PlexyNetworking")],
            path: "Plexy",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension"
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
                .target(name: "Plexy")
            ],
            path: "PlexyActions",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension"
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
                "Utilities/Non SPM Bundle Extension"
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
        )
    ]
)
