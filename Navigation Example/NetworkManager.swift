//
//  NetworkManager.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var usersResponse: UsersResponse?
    @Published var isLoading = false
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://reqres.in/api/users") else { return }
        
        self.isLoading = true
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let usersResponse = try! JSONDecoder().decode(UsersResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.usersResponse = usersResponse
                self.isLoading = false
                dump(usersResponse)
            }
        }.resume()
        
    }
    
}
