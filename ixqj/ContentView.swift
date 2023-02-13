//
//  ContentView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var currTab: CustomTabbar = .home

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationStack {
            TabView(selection: $currTab) {
                HomeView()
                    .badge(2)
                            .tabItem {
                                Label("主页", systemImage: "tray.and.arrow.down.fill")
                            }
                    .tag(CustomTabbar.home)
                
                MyView()
                    .badge("!")
                            .tabItem {
                                Label("我的", systemImage: "person.crop.circle.fill")
                            }
                    .tag(CustomTabbar.mine)
            }
        }
    }

}
