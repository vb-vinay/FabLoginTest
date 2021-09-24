//
//  NetworkManager.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import Foundation

enum DataErrors: String, Error {
    case invalidURL = "Invalid"
    case invalidData
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let endpoint = "https://api.npoint.io/0774724810730d4ee184"
    private let endpointUsers = "https://jsonplaceholder.typicode.com/posts"
    
    typealias token = (LoginResponse?) -> ()
    typealias users = ([UserList]?) -> ()
    
    
    func getData(completion : @escaping (Result<LoginResponse, DataErrors>) -> ()){
        completion(.failure(.invalidData))
    }
    
    // We can further create a generic code for the networking (to create abstraction)
    func getLoginToken(username: String, password: String, completion: @escaping (token) ) {
        
        // We can use the latest Result type here
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil)
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Invalid Response")
                completion(nil)
            }
            guard let data = data else {
                print("Invalid data")
                return
            }
            do {
                let userToken = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(userToken)
            } catch {
                completion(nil)
            }
            
        }
        task.resume()
    }
    
    func getUsers(completion: @escaping (users)) {
        
        guard let url = URL(string: endpointUsers) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil)
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Invalid Response")
                completion(nil)
            }
            guard let data = data else {
                print("Invalid data")
                return
            }
            do {
                let users = try JSONDecoder().decode([UserList].self, from: data)
                completion(users)
            } catch {
                completion(nil)
            }
            
        }
        task.resume()
    }
}
