// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AttributedStringBuilder",
    products: [
        .library(
            name: "AttributedStringBuilder",
            targets: ["AttributedStringBuilder"]),
    ],
    dependencies: [.package(url: "https://github.com/Quick/Nimble", from: "8.1.1")],
    targets: [
        .target(name: "AttributedStringBuilder"),
        .testTarget(
            name: "AttributedStringBuilderTests",
            dependencies: ["AttributedStringBuilder", "Nimble"]),
    ])
