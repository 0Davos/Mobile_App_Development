//
//  iOS_Assignment_1App.swift
//  iOS Assignment 1
//
//  Created by user285571 on 10/7/25.
//

import SwiftUI
import CoreData

@main
struct iOS_Assignment_1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
