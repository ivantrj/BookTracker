//
//  DataController.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BookTracker")
    
    init() {
        container.loadPersistentStores { decription, error in
            if let error = error {
                print("failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}
