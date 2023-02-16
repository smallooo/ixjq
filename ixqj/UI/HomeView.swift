//
//  HomeView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import Foundation
import SwiftUI
import backend

struct HomeView: View {
    @State var dodoCode = AppUserDefaults.shared.dodoCode
    
    
    var body: some View {
        VStack {
            Text(AppUserDefaults.shared.dodoCode)
            ItemImage(path: "", size: 100)
            NavigationLink {
                GreetingView()
            } label: {
                Image(systemName: "list.dash")
                    .foregroundColor(.gray)
            }
            
            Text(UserDefaults.standard.string(forKey: "token") ?? "")
        }
    }
}

func greeting() {
        print("Hello, World!")
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
