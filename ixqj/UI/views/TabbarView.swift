//
//  TabbarView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/13.
//

import SwiftUI


struct TabbarView: View {
    @EnvironmentObject private var uiState: UIState
    @State var currTab: CustomTabbar = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currTab){
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



