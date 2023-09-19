import SwiftUI
import NutriRankUI
import NutriRankKit

@main
struct NutriRankApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        await NutriRankKit.test()
                    }
                }
        }
    }
}
