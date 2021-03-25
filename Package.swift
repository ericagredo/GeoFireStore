// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeoFireStore",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GeoFireStore",
            targets: ["GeoFireStore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Firebase",
                 url: "https://github.com/firebase/firebase-ios-sdk.git", from: "7.8.1")
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "GeoFire",
                dependencies: [.product(name: "FirebaseDatabase", package: "Firebase")],
                cSettings: [
                   .headerSearchPath("include"), // 5
                ]),
        .target(
            name: "GeoFireStore",
            dependencies: [.product(name: "FirebaseFirestore", package: "Firebase"), "GeoFire"]),
        .testTarget(
            name: "GeoFireStoreTests",
            dependencies: ["GeoFireStore"]),
    ]
)
