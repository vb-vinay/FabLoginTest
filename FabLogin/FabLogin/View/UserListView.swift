//
//  UserListView.swift
//  FabLogin
//
//  Created by Vinay Bharwani on 9/24/21.
//

import SwiftUI


struct UserListView: View {
    
    @ObservedObject var vm = UsersVM()
    
    var body: some View {
        List(vm.users){ user in
            HStack {
                VStack(alignment: .leading){
                    Text(user.title)
                    Text(user.body)
                }.padding()
            }
        }
        .onAppear{
            vm.getUsers()
        }
        .navigationTitle("Users")
    }
    
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
