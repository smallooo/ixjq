//
//  ixqjApp.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import SwiftUI

@main
struct ixqjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
   
}
