//
//  MyView.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import SwiftUI

struct MyView: View {
    @StateObject var viewModel: MyViewModel
    @State var isView1Active: Bool = false
    @State var isLogin: Bool = false
    
    init(){
        
        self._viewModel = StateObject(wrappedValue: MyViewModel(userName: "username"))
    }
    
    var body: some View {
        VStack {
            
            if(true){
                Text("logined in")
            }else{
                Text("Login")
            }
            
            NavigationLink(destination: DetailView(), isActive: $isView1Active) {
                Text("View 1")
                    .font(.headline)
            }
            
            Button {
                viewModel.login()
            } label: {
                VStack {
                    Text(viewModel.token + "login")
                }
            }
            .frame(maxWidth: .infinity)
    
        
        
            
            Button {
                viewModel.testNetwork()
            } label: {
                VStack {
                    Text(viewModel.token + "testnetwork")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
