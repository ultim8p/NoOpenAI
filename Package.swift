// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NoOpenAI",
    platforms: [
       .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NoOpenAI",
            targets: ["NoOpenAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/ultim8p/NoVaporAPI.git", branch: "main"),
        .package(url: "https://github.com/ultim8p/NoLogger.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NoOpenAI",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "NoVaporAPI", package: "NoVaporAPI"),
                .product(name: "NoLogger", package: "NoLogger"),
            ]),
        .testTarget(
            name: "NoOpenAITests",
            dependencies: ["NoOpenAI"]),
    ]
)
