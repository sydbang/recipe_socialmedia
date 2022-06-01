//
//  LaunchView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-03-22.
//

import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        if !user.loggedIn {
            //Showing logged out view
            LoginView()
                .onAppear() {
                    // Check if the user is logged in or out
                    user.checkLogin()
                }
        } else {
            // Show logged in view
            RecipeTabView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
