//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

@main
struct BookTrackerApp: App {
    @StateObject private var dataController = DataController()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
