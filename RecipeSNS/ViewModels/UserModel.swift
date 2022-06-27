//
//  UserModel.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-03-22.
//

import Foundation
import Firebase
import FirebaseAuth

class UserModel: ObservableObject {
    
    @Published var loggedIn: Bool = false
    @Published var user = User()
    
    
    
    init() {
        getData()
        
    }
    
    func getData() {
        
        if let currentUser = Auth.auth().currentUser {
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Read the documents at a specific path
            let path = db.collection("users").document(currentUser.uid)
            
            path.getDocument { (docSnapshot, error) in
                // Check for error and handle it appropriately
                if let error = error {
                    print(error.localizedDescription)
                } else if let docSnapshot = docSnapshot {
                    self.user = User(id: docSnapshot.documentID, userId: docSnapshot["userId"] as? String ?? "", email: docSnapshot["email"] as? String ?? "", name: docSnapshot["name"] as? String ?? "")
                } else {
                    // No data returned
                    
                }
            }
        }
    }
    
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser != nil ? true : false
    }
}
