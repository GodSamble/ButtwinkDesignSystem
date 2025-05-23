// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/SnapKit/SnapKit",
            .upToNextMajor(from: "5.0.0")
        ),
        .package(
            url: "https://github.com/airbnb/lottie-ios.git",
            .upToNextMajor(from: "4.2.0")
        ),
        .package(
            url: "https://github.com/devxoul/Then",
            .upToNextMajor(from: "3.0.0")
        ),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "Then", package: "Then")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]
        ),
    ]
)
