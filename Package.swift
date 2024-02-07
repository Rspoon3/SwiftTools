// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTools",
    platforms: [
        .iOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SwiftTools",
            targets: ["SwiftTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Rspoon3/SFSymbols.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SwiftTools",
            dependencies: [
                "SFSymbols"
            ]
        )
    ]
)
