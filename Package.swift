// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FastSdk",
    products: [
        .library(
            name: "FastSdk",
            targets: ["FastSdk"]
        ),
    ],
    targets: [
        .target(
            name: "FastSdk"
        ),
        .testTarget(
            name: "FastSdkTests",
            dependencies: ["FastSdk"]
        ),
    ]
)
