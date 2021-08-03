// swift-tools-version:5.5

import PackageDescription

let package = Package(
        name: "Skoptsy",
        products: [
            .library(
                    name: "Skoptsy",
                    targets: ["Skoptsy"])
        ],
        dependencies: [
        ],
        targets: [
            .target(
                    name: "Skoptsy",
                    dependencies: []),
            .testTarget(
                    name: "SkoptsyTests",
                    dependencies: ["Skoptsy"])
        ]
)
