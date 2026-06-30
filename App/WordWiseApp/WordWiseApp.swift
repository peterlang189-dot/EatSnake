import SwiftUI
import WordWiseCore

@main
struct WordWiseApp: App {
    @StateObject private var model = SnakeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
