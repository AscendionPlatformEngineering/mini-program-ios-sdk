// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MiniProgramFramework",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "MiniProgram", targets: ["MiniProgram"])
    ],
    targets: Target.allTargets()
)

/// Public target
extension Target {
    static func allTargets() -> [Target] {
        [
            miniProgramTargets()
        ].flatMap { $0 }
    }
    
    static func miniProgramTargets() -> [Target] {
        [
            .target(
                name: "MiniProgram",
                dependencies: [
                  "MiniProgramSDK"
                ],
                path: "MiniProgram/Sources"
            ),
            .binaryTarget(
                name: "MiniProgramSDK",
                path: "./MiniProgram/Sources/Resources/MiniProgramSDK.xcframework"
            )
        ]
    }
}
