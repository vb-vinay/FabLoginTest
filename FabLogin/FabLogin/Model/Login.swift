//
//  Login.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import Foundation


struct LoginRequest: Encodable {
    var username: String
    var password: String
}

struct LoginResponse: Decodable {
    var token: String
    var fullName: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case fullName = "full_name"
    }
}


