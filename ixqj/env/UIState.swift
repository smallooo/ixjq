//
//  UIState.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/13.
//

import Foundation
import SwiftUI



class UIState: ObservableObject {
    public static let shared = UIState()
    
    enum Tab: Int {
        case dashboard, items, villagers, collection, turnips
    }
    
    enum Route: Identifiable {
        case dodo, news
        case item(item: Item)
       
        
        static let prefix = "achelperapp"
        
        var id: String {
            switch self {
            case .item(_): return "item"
            
            case .dodo: return "dodocodes"
            case .news: return "news"
            }
        }

        @ViewBuilder
        func makeSheetView() -> some View {
            NavigationView {
                
            }
        }
    }
    
    @Published var selectedTab = Tab.dashboard
    @Published var route: Route?
}

