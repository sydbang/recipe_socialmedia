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
    @State var isShowingAddRecipeView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image ("Profile Picture")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    NavigationLink(destination: AddRecipeView(tabSelection: $selectedTab, isShowingAddRecipeView: $isShowingAddRecipeView), isActive: $isShowingAddRecipeView, label: {Image(systemName: "plus.circle")})
                        
 
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

