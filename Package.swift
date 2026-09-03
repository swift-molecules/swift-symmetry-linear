// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry-linear",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry Linear",
            targets: ["Symmetry Linear"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-symmetry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-linear.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-spatial.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry Linear",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Linear", package: "swift-linear"),
                .product(name: "Spatial", package: "swift-spatial"),
            ]
        ),
        .testTarget(
            name: "Symmetry Linear Tests",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Linear", package: "swift-linear"),
                .product(name: "Spatial", package: "swift-spatial"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
