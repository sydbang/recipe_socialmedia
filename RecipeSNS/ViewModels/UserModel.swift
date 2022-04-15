//
//  UserModel.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-03-22.
//

import Foundation
import FirebaseAuth

class UserModel: ObservableObject {
    
    @Published var loggedIn: Bool = false
    
    init() {
    }
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser != nil ? true : false
    }
}
