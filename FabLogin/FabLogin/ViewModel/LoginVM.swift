//
//  LoginVM.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import Foundation

class LoginVM: ObservableObject {
    
    @Published var tokenReceived: Bool = false
    @Published var showAlert: Bool = false
    
    func validateAndGetToken(username: String, password: String){
        
        self.showAlert = username.isEmpty || password.isEmpty
        
        if showAlert == false {
            NetworkManager.shared.getLoginToken(username: username, password: password) { response in
                DispatchQueue.main.async {
                    self.tokenReceived =  response != nil
                }
            }
        }
        
        
    }
}
