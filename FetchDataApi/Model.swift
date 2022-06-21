//
//  Model.swift
//  FetchDataApi
//
//  Created by Developer Light on 21.06.2022.
//

import Foundation


struct Comments: Codable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let body: String
}

class apiCall {
    func getUserComments(completion: @escaping ([Comments]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {
            print("Api not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let comments = try! JSONDecoder().decode([Comments].self, from: data!)
            print(comments)
            
            DispatchQueue.main.async {
                completion(comments)
            }
        }
        .resume()
    }
}
