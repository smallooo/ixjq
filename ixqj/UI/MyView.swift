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
    
    @State var saveDateString: String = ""
    @State var readDateString: String = "1"
    
    init(){
        self._viewModel = StateObject(wrappedValue: MyViewModel(userName: "username"))
    }
    
    var body: some View {
        VStack {
            if(viewModel.isLoading){
                Text("loading")
            }else{
                Text("not loading")
            }
            
            if(viewModel.post != nil){
                Text(viewModel.post?.data.token ?? "")
            }else{
                Text("Click to Login")
            }
            
            NavigationLink(destination: DetailView(), isActive: $isView1Active) {
                Text("View 1")
                    .font(.headline)
            }
            
            Button {
                viewModel.isLoading = true
                viewModel.login()
                AppUserDefaults.shared.dodoCode = "dodoCode 654321"
            } label: {
                VStack {
                    Text(viewModel.token + "login")
                }
            }
            .frame(maxWidth: .infinity)
    
            Button {
               // viewModel.testNetwork()
                let date = Date()
                saveDateString =  DateFormatter().string(from: date) + "iiie"
                UserDefaults.standard.set(saveDateString , forKey: "jjj")
                readDateString = UserDefaults.standard.string(forKey: "jjj") ?? ""
            } label: {
                VStack {
                    Text(readDateString)
                    Text(viewModel.token + "UserDefaults")
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
