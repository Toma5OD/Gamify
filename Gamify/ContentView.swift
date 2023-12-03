import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            // Replace this with your main app view
            // Example: A welcome message and a logout button
            VStack {
                Text("Welcome, User!")
                Button("Logout") {
                    isLoggedIn = false
                }
            }
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}
