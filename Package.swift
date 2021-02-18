// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "MediaShadow",
    platforms: [
       .macOS(.v10_15)
    ],
    /*products: [
        .library(
            name: "MediaShadow",
            targets: ["MediaShadow"]),
    ],*/
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio", from: "2.13.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl", from: "2.6.0"),
        .package(url: "https://github.com/apple/swift-nio-http2", from: "1.9.0"),
        .package(url: "https://github.com/apple/swift-nio-extras", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MediaShadow",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOTLS", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2"),
                .product(name: "NIOExtras", package: "swift-nio-extras")
            ]),
        .target(name: "Run",
                dependencies: [.target(name: "MediaShadow")]
        ),
        .testTarget(
            name: "MediaShadowTests",
            dependencies: ["MediaShadow"]),
    ]
)
