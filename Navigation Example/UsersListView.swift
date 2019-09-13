//
//  UsersListView.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import SwiftUI

struct UsersListView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            Group {
                if networkManager.isLoading {
                    Text("Loading")
                } else {
                    List (networkManager.usersResponse!.users, id: \.id) { user in
                        UserRow(user: user)
                    }
                }
            }
            .navigationBarTitle(Text("Users"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
