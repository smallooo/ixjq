//
//  HomeView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Hello HomeView")
        Button("Greeting", action: greeting)
    
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
