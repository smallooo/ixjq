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
    
    private var apiPublisher: AnyPublisher<[String: String], Never>?
    private var cancellable: AnyCancellable?
        
    init(userName: String) {
        self.token = userName
    }
    
//    func fetchItems() {
//        if let filename = villager.fileName {
//            _ = Items.shared.matchVillagerItems(villager: filename)
//                .subscribe(on: DispatchQueue.global(qos: .userInitiated))
//                .receive(on: DispatchQueue.main)
//                .sink(receiveValue: { [weak self] items in
//                    self?.villagerItems = items
//                })
//
//            _ = Items.shared.matchVillagerPreferredGifts(villager: filename)
//                .subscribe(on: DispatchQueue.global(qos: .userInitiated))
//                .receive(on: DispatchQueue.main)
//                .sink(receiveValue: { [weak self] items in
//                    self?.preferredItems = items
//                })
//
//            self.likes = Items.shared.villagersLike.values
//                .first(where: { $0.id == filename })?
//                .likes
//                .unique()
//
//        } else {
//            self.villagerItems = nil
//            self.preferredItems = nil
//        }
//    }
    
//    struct Post: Codable {
//        let title: String
//        let body: String
//    }
    
    enum HTTPError: LocalizedError {
        case statusCode
        case post
    }

    struct Post: Codable {

        let id: Int
        let title: String
        let body: String
        let userId: Int
    }

    struct Todo: Codable {

        let id: Int
        let title: String
        let completed: Bool
        let userId: Int
    }

    
    func getPosts()  {
        

        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                fatalError("Error: invalid HTTP response code")
            }
            guard let data = data else {
                fatalError("Error: missing response data")
            }

            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                print(posts.map { $0.title })
            }
            catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
            
    }
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    private var posts: [Post] = [] {
           didSet {
               print("posts --> \(self.posts.count)")
           }
       }
    
    func getPostByCombine() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

                cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [Post].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .assign(to: \.posts, on: self)
    }
    
    public func login() {
        
       
        getPostByCombine()
        

        
    }
    
    public func testNetwork(){
        let url = URL(string: "http://127.0.0.1:8000/test")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                 if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                 }
              } catch let error {
                print(error.localizedDescription)
              }
           })
           task.resume()
    }
}
