// swift-tools-version: 5.7

// This file was automatically generated by PackageGenerator and untracked
// PLEASE DO NOT EDIT MANUALLY

import PackageDescription

let package = Package(
    name: "ComplexTarget",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ComplexTarget",
            targets: ["TargetA", "LocalBinaryTarget"]
        ),
    ],
    dependencies: [
        .package(
            path: "../LocalDependencies"
        ),
        .package(
            url: "https://github.com/DependencyA",
            exact: "1.0.0"
        ),
        .package(
            url: "https://github.com/DependencyB",
            exact: "2.0.0"
        ),
    ],
    targets: [
        .target(
            name: "TargetA",
            dependencies: [
                .product(name: "LocalDependencyA", package: "LocalDependencyA"),
                .product(name: "RemoteDependencyA", package: "RemoteDependencyA"),
                .product(name: "RemoteDependencyB", package: "RemoteDependencyB"),
                .target(name: "LocalBinaryTarget"),
                .target(name: "RemoteBinaryTarget"),
            ],
            path: "Framework/Sources",
            exclude: [
                "/path1",
                "/path1/path2",
            ],
            resources: [
                .process("Resources")
            ],
            plugins: [
            ]
        ),
        .testTarget(
            name: "TargetATests",
            dependencies: [
                .byName(name: "TargetA"),
                .product(name: "RemoteDependencyB", package: "RemoteDependencyB"),
                .target(name: "LocalBinaryTarget"),
                .target(name: "RemoteBinaryTarget"),
            ],
            path: "Tests/Sources",
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .define("setting"),
                .unsafeFlags(["flag"]),
            ],
            plugins: [
            ]
        ),
        .binaryTarget(
            name: "LocalBinaryTarget",
            path: "path/LocalBinaryTarget"
        ),
        .binaryTarget(
            name: "RemoteBinaryTarget",
            url: "https://github.com/RemoteBinaryTarget.zip",
            checksum: "12345"
        ),
    ]
)