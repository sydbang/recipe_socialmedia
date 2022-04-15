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
    
    var body: some View {
        VStack {
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

struct RecipeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeProfileView()
    }
}
