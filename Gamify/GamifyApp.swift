//
//  GamifyApp.swift
//  Gamify
//
//  Created by Tomás Ó Dálaigh on 02/12/2023.
//

import SwiftUI

@main
struct GamifyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
