//
//  UserDetailsView.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack {
            NetworkImage(imageUrl: user.avatar)
            
            Text(user.firstName + " " + user.lastName)
                .font(.title)
            
            Text(user.email)
                .font(.headline)
            
        }
        .navigationBarTitle(Text(user.firstName))
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User(id: 1, email: "dheerajbhavsar@icloud.com", firstName: "Dheeraj", lastName: "Bhavsar", avatar: ""))
    }
}
