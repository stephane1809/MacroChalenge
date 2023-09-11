import SwiftUI
import NutriRankUI

@main
struct NutriRankApp: App {
    var body: some Scene {
        WindowGroup {
            FakeDoorView()
            NavigationLink("Ir para página de grupo", destination: GroupView())
        }
    }
}
