//
//  UserRow.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    var body: some View {
        NavigationLink(destination: UserDetailsView(user: user)) {
            HStack {
                NetworkImage(imageUrl: user.avatar)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                VStack (alignment: .leading) {
                    Text(user.firstName + " " + user.lastName)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: 1, email: "dheerajbhavsar@icloud.com", firstName: "Dheeraj", lastName: "Bhavsar", avatar: ""))
    }
}
