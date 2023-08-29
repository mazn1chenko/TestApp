//
//  NetworkManager.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import Foundation

enum ApiType {
    
    case getAllPost
    case getSoloPost
    
    
    var baseURL: String {
        return "https://raw.githubusercontent.com/"
    }
    
    var headers: [String: String] {
        
        switch self {
            
        case .getAllPost: return [:]
            
        case .getSoloPost: return [:]
            
        }
        
    }
    //https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json
    //https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/[id].json
    var path: String {
        
        switch self {
            
        case .getAllPost: return "anton-natife/jsons/master/api/main.json"
            
        case .getSoloPost: return "anton-natife/jsons/master/api/posts/[id].json"
            
        }
    }
    
    var request: URLRequest {
        
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        switch self {
        case .getAllPost:
            request.httpMethod = "GET"
            return request
            
        case .getSoloPost:
            request.httpMethod = "GET"
            return request
        }
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func getAllPosts(completion: @escaping (AllPost) -> Void) {
        
        let request = ApiType.getAllPost.request
        print("\(request)")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let post = try? JSONDecoder().decode(AllPost.self, from: data){
                print("HOW MANY POSTS DO YOU HAVEE SUKA /n\(post)")
                completion(post)
                
            } else {
                print("ERROR IN getAllPosts")
//                completion([])
            }
            
        }
        .resume()
    }
}
