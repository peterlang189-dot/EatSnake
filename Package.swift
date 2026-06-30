// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "WordWise",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "WordWiseCore",
            targets: ["WordWiseCore"]
        )
    ],
    targets: [
        .target(name: "WordWiseCore"),
        .testTarget(
            name: "WordWiseCoreTests",
            dependencies: ["WordWiseCore"]
        )
    ]
)
