import SwiftUI

@main
struct NutriRankApp: App {
    var body: some Scene {
        WindowGroup {
            ChallengeGroupFactory.make()
        }
    }
}
