// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Card-iOS",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Card-iOS",
            targets: ["Card-iOS"]),
    ], 
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/huri000/SwiftEntryKit.git", from: "1.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        .package(url: "https://github.com/TakeScoop/SwiftyRSA.git", from: "1.0.0"),
        .package(url: "https://github.com/Tap-Payments/SharedDataModels-iOS.git", from: "0.0.1"),
        .package(url: "https://github.com/Tap-Payments/TapCardScannerWebWrapper-iOS.git", exact: "0.0.6"),
        .package(url: "https://github.com/batuhangobekli/TapFontKit-iOS", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Card-iOS",
            dependencies: ["SwiftEntryKit",
                                           "SnapKit",
                                           "SwiftyRSA",
                                           "SharedDataModels-iOS",
                                            "TapFontKit-iOS",
                                           "TapCardScannerWebWrapper-iOS"],
                             resources: [.copy("Resources/Dark_Mode_Button_Loader.json"),
                                         .copy("Resources/Light_Mode_Button_Loader.json"),
                                         .process("Resources/TapCardMedia.xcassets")],
            swiftSettings: [
                    .define("SPM")
                  ]
            ),
        .testTarget(
            name: "Card-iOSTests",
            dependencies: ["Card-iOS"]),
    ],
    swiftLanguageVersions: [.v5]
)
