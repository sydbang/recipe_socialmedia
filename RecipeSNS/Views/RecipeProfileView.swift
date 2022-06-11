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
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        Text("@SydneyBang")
                        Text("Like to be a quick and easy food chef, so that's what you will find here!")
                    }
                    
                    NavigationLink(destination: AddRecipeView(tabSelection: $selectedTab, isShowingAddRecipeView: $isShowingAddRecipeView), isActive: $isShowingAddRecipeView, label: {Image(systemName: "plus.circle")
                        .frame(height:20)
                    })
                }
                .padding()
                
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

