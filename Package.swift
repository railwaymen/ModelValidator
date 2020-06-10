// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "ModelValidator",
    products: [
        .library(
            name: "ModelValidator",
            targets: ["ModelValidator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ModelValidator",
            dependencies: []),
        .testTarget(
            name: "ModelValidatorTests",
            dependencies: ["ModelValidator"]),
    ]
)
