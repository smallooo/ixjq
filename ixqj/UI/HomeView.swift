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
    var body: some View {
        VStack {
            Text("Hello HomeView")
            
            ItemImage(path: "", size: 100)
            
            
            NavigationLink {
                GreetingView()
            } label: {
                Image(systemName: "list.dash")
                    .foregroundColor(.gray)
            }
            
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
