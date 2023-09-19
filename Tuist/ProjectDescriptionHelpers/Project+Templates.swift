import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
        return Project(name: name,
                       organizationName: "Merendeers",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "com.merendeers.\(name)",
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: [])
        let tests = Target(name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "com.merendeers.\(name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.merendeers.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.merendeers.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget, testTarget]
    }
}

extension Project {

    public static func makeCleanArchApp(
        mainAppTargetName: String,
        mainAppTargetOrganizationName: String,
        iOSTargetVersion: String
    ) -> Project {

        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        /// Main target is the one Xcode will point to in order to compile
        /// In this particular method of creating projects, this is the Composional Root

        let mainTarget = Target(
            name: mainAppTargetName,
            platform: .iOS,
            product: .app,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(mainAppTargetName)/Sources/**"],
            resources: ["Targets/\(mainAppTargetName)/Resources/**"],
            dependencies: [
                .target(name: "\(mainAppTargetName)Data"),
                .target(name: "\(mainAppTargetName)Presentation"),
                .target(name: "\(mainAppTargetName)Domain"),

                /// External frameworks are also declared here.
                /// IE: .external(name: "Localize"),
                /// IE: .sdk(name: "CloudKit", type: .framework)
                /// Refer to the official Tuist documentation for this as my knowledge on external dependencies is limited.

            ]
        )

        let mainTargetTesting = Target(
            name: "\(mainAppTargetName)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)Tests",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)/Tests/**"],
            dependencies: [
                .target(name: "\(mainAppTargetName)")
        ])

        /// Domain targets.
        /// Business logic and all that stuff.

        let domainTarget = Target(
            name: "\(mainAppTargetName)Domain",
            platform: .iOS,
            product: .framework,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)Domain",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Domain/Sources/**"],
            resources: [],
            dependencies: [])

        let domainTargetTesting = Target(
            name: "\(mainAppTargetName)DomainTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)DomainTests",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Domain/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "\(mainAppTargetName)Domain")
        ])

        /// Presentation and Data layer targets.

        let presentationTarget = Target(
            name: "\(mainAppTargetName)Presentation",
            platform: .iOS,
            product: .framework,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)Presentation",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Presentation/Sources/**"],
            resources: [],
            dependencies: [.target(name: "\(mainAppTargetName)Domain")])

        let presentationTargetTesting = Target(
            name: "\(mainAppTargetName)PresentationTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)PresentationTests",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Presentation/Tests/**"],
            resources: [],
            dependencies: [.target(name: "\(mainAppTargetName)Presentation")])

        let dataTarget = Target(
            name: "\(mainAppTargetName)Data",
            platform: .iOS,
            product: .framework,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)Data",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Data/Sources/**"],
            resources: [],
            dependencies: [.target(name: "\(mainAppTargetName)Domain")])

        let dataTargetTesting = Target(
            name: "\(mainAppTargetName)DataTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(mainAppTargetOrganizationName).\(mainAppTargetName)DataTests",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/\(mainAppTargetName)Data/Tests/**"],
            resources: [],
            dependencies: [.target(name: "\(mainAppTargetName)Data")])

        let targets: [Target] = [mainTarget,
                                 mainTargetTesting,
                                 domainTarget,
                                 domainTargetTesting,
                                 presentationTarget,
                                 presentationTargetTesting,
                                 dataTarget,
                                 dataTargetTesting
        ]

        return Project(name: mainAppTargetName, organizationName: mainAppTargetOrganizationName, targets: targets)

    }

}
