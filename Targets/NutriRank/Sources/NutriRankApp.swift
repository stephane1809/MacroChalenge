import SwiftUI

@main
struct NutriRankApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ChallengeGroupFactory.make()
        }
    }
}
