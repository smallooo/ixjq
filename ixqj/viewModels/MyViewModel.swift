//
//  MyViewModel.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/14.
//

import Foundation
import Combine
import backend

public class MyViewModel: ObservableObject {
    //let villager: Villager
//    @Published var villagerItems: [Item]?
//    @Published var preferredItems: [Item]?
//    @Published var likes: [String]?
    
    @Published var token: String
    @Published var isLoading = false
    
    @Published var post: Post?
    
    public struct Post:  Codable, Equatable {
        public let code: Int
        public let data: Data
        public let msg: String?
    }
    
    public struct Data: Codable, Equatable {
        public let token: String?
    }
    
    private var apiPublisher: AnyPublisher< Post, Never>?
    private var cancellable: AnyCancellable?
    
    private var apiCancellable: AnyCancellable? {
        willSet {
            apiCancellable?.cancel()
        }
    }
        
    init(userName: String) {
        self.token = userName
    }
        
    public func login() {
        apiPublisher = XQJApiService.fetch(endpoint: .login)
            .subscribe(on: DispatchQueue.global())
            .replaceError(with: Post(code: 404, data: Data(token: "no token"), msg: "error message"))
            .eraseToAnyPublisher()
        
        apiCancellable = apiPublisher?
            .subscribe(on: DispatchQueue.global())
            .map{ $0 }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
               // NSLog($0.data.token ?? "")
                NSLog(String($0.code))
                NSLog($0.msg ?? "")
                
                self.post = $0
               // NSLog(self.post?.data ?? "")
                self.isLoading = false
            })
    }
}
