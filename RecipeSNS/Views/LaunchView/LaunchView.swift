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
    
    @State var loginFormShowing = false
    @State var createAccountFormShowing = false
    
    var body: some View {
        if !user.loggedIn {
            //Showing logged out view
            VStack (spacing: 20) {
                
                // Sign in button
                Button {
                    // show login form
                    loginFormShowing = true
                } label: {
                    Text("Sign In")
                }
                .sheet(isPresented: $loginFormShowing, onDismiss: checkLogin) {
                    LoginForm(formShowing: $loginFormShowing)
                }
                
                // Create account button
                Button {
                    createAccountFormShowing = true
                } label: {
                    Text("Create Account")
                }
                .sheet(isPresented: $createAccountFormShowing, onDismiss: checkLogin) {
                    CreateAccountForm(formShowing: $createAccountFormShowing)
                }

            }
        } else {
            // Show logged in view
            RecipeTabView()
        }
    }
    
    func checkLogin() {
        user.loggedIn = Auth.auth().currentUser == nil ? false : true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
