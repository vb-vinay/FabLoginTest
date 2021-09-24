//
//  UsersVM.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import Foundation

class UsersVM: ObservableObject {
    
    @Published var users: [UserList] = []
    
    func getUsers() {
        NetworkManager.shared.getUsers { users in
            DispatchQueue.main.async {
                if let users = users {
                    self.users = users
                } else {
                    print("Invalid")
                }
            }
        }
    }
}
