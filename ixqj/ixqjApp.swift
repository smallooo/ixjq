//
//  ixqjApp.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import SwiftUI
import UI

@main
struct ixqjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(AppUserDefaults.shared)
                    .onAppear(perform: setupAppearance)
            }

    }
    
   
    
    
    private func setupAppearance() {
        //TODO: Move that to SwiftUI once implemented
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1).withSymbolicTraits(.traitBold)?.withDesign(UIFontDescriptor.SystemDesign.rounded)
        let descriptor2 = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withSymbolicTraits(.traitBold)?.withDesign(UIFontDescriptor.SystemDesign.rounded)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.font:UIFont.init(descriptor: descriptor2!, size: 34),
            NSAttributedString.Key.foregroundColor: UIColor(named: "ACText",
                                                            in: UIBundle,
                                                            compatibleWith: nil)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font:UIFont.init(descriptor: descriptor!, size: 17),
            NSAttributedString.Key.foregroundColor: UIColor(named: "ACText",
                                                            in: UIBundle,
                                                            compatibleWith: nil)!
        ]
        
        UINavigationBar.appearance().barTintColor = UIColor(named: "ACSecondaryBackground",
                                                            in: UIBundle,
                                                            compatibleWith: nil)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor(named: "ACText",
                                                         in: UIBundle,
                                                         compatibleWith: nil)
        
        UITableView.appearance().backgroundColor = UIColor(named: "ACBackground",
                                                           in: UIBundle,
                                                           compatibleWith: nil)
        UITableView.appearance().tableFooterView = UIView()
    }
    
}
