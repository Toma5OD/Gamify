import SwiftUI

@main
struct GamifyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
