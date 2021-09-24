//
//  ContentView.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username : String = ""
    @State private var password : String = ""
    
    @State private var isActive: Bool = false
    
    @StateObject var vm = LoginVM()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("icon")
                Spacer()
                TextField("Username", text: $username)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .border(Color.gray, width: 1)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke())
                    .padding(.vertical)
                
                TextField("Password", text: $password)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .border(Color.gray, width: 1)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke())
                    
                Spacer()
                NavigationLink(
                    destination: UserListView(),
                    isActive: $vm.tokenReceived, label: {
                        Button("Login") {
                            vm.validateAndGetToken(username: username, password: password)
                        }
                    })
                Spacer()
            }.padding()
            .alert(isPresented: $vm.showAlert, content: {
                Alert(title: Text("Empty Fields"), message: Text("Username or Password is empty"), dismissButton: .cancel())
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(vm: LoginVM())
    }
}
