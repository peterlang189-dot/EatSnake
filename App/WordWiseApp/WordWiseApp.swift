import SwiftUI
import WordWiseCore

@main
struct WordWiseApp: App {
    @StateObject private var model = StudyViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
