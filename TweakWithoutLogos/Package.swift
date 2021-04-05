// swift-tools-version:5.2

import PackageDescription
import Foundation

let theosPath = ProcessInfo.processInfo.environment["THEOS"]!

let libFlags = [
    "-F\(theosPath)/vendor/lib",
    "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include",
    "-I\(theosPath)/include"
]

let package = Package(
    name: "TweakWithoutLogos",
    products: [
        .library(
            name: "TweakWithoutLogos",
            targets: ["TweakWithoutLogos"]
        )
    ],
    targets: [
        .target(
            name: "TweakWithoutLogos",
            cSettings: [.unsafeFlags(libFlags)]
        )
    ]
)
