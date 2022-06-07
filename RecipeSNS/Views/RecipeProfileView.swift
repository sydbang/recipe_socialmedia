//
//  RecipeProfileView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI
import FirebaseAuth

struct RecipeProfileView: View {
    
    @EnvironmentObject var user: UserModel
    
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    NavigationLink(destination: AddRecipeView(tabSelection: $selectedTab), label: {Image(systemName: "plus.circle")})
                        
 
                }
                Text("Profile")
                
                Button {
                    try! Auth.auth().signOut()
                    user.loggedIn = false
                } label: {
                    Text("Sign Out")
                }
            }
        }
    }
}

