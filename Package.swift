// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "XMTPiOS",
	platforms: [.iOS(.v14), .macOS(.v11)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "XMTPiOS",
			targets: ["XMTPiOS"]
		),
		.library(
			name: "XMTPTestHelpers",
			targets: ["XMTPTestHelpers"]
		),
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),

		//.package(url: "https://github.com/viktar-iosdev/secp256k1", from: "0.10.0"),
        .package(url: "https://github.com/Boilertalk/secp256k1.swift.git", from: "0.1.1"),
		.package(url: "https://github.com/viktar-iosdev/swiftWeb3", from: "1.1.0"),
		.package(url: "https://github.com/1024jp/GzipSwift", from: "5.2.0"),
		.package(url: "https://github.com/viktar-iosdev/connect-swift", exact: "0.3.0"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0"),
		.package(url: "https://github.com/xmtp/libxmtp-swift", revision: "ccbf6ac"),
//		.package(path: "../libxmtp-swift")
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "XMTPiOS",
			dependencies: [
				.product(name: "secp256k1", package: "secp256k1.swift"),
                //.product(name: "secp256k1", package: "secp256k1"),
                //"secp256k1",
                //.product(name: "web3.swift", package: "swiftWeb3"),
                //"swiftWeb3",
				.product(name: "Gzip", package: "GzipSwift"),
				.product(name: "Connect", package: "connect-swift"),
				.product(name: "LibXMTP", package: "libxmtp-swift"),
			]
		),
		.target(
			name: "XMTPTestHelpers",
			dependencies: ["XMTPiOS"]
		),
		.testTarget(
			name: "XMTPTests",
			dependencies: ["XMTPiOS", "XMTPTestHelpers"]
		),
	]
)
