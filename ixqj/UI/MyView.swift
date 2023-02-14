//
//  MyView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import SwiftUI

struct MyView: View {
    @State var isView1Active: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello MyView")
            NavigationLink(destination: DetailView(), isActive: $isView1Active) {
                Text("View 1")
                    .font(.headline)
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
