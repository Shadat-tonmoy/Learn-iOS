//
//  CoreDataTestAppApp.swift
//  CoreDataTestApp
//
//  Created by Shadat Tonmoy on 5/5/23.
//

import SwiftUI

@main
struct CoreDataTestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
