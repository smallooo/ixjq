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
            TabbarView()
        }
    }
}
