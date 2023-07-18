// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "screenlogger",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(
             url: "https://github.com/apple/swift-openapi-generator",
            .upToNextMinor(from: "0.1.0")
        ),
        .package(
            url: "https://github.com/apple/swift-openapi-runtime",
            .upToNextMinor(from: "0.1.0")
        ),
        .package(
            url: "https://github.com/swift-server/swift-openapi-vapor",
            .upToNextMinor(from: "0.1.0")
        ),
        .package(
            url: "https://github.com/vapor/vapor",
            .upToNextMajor(from: "4.69.2")
        ),
    ],
    targets: [
        .executableTarget(
            name: "screenlogger",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
                .product(name: "Vapor", package: "vapor"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
    ]
)
