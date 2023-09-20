import SwiftUI
import UIKit
import Foundation

public struct ContentView: View {
    public init() {}

    public var body: some View {
//        Text("Hello")
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0.0){

                    Rectangle()
                        .fill(.purple)
                        .containerRelativeFrame([.horizontal, .vertical])
            }
        }

    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
