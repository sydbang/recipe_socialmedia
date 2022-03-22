//
//  LoginForm.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-03-22.
//

import SwiftUI
import FirebaseAuth

struct LoginForm: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    @Binding var formShowing: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button {
                    // perform login
                    signIn()
                } label: {
                    HStack {
                        Text("Sign In")
                    }
                }

            }
            .navigationBarTitle("Sign In")
        }
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            //May need DispatchQueue.main.async {}
            if error == nil {
                // successful login dissmiss sheet
                formShowing = false
            } else {
                errorMessage = error?.localizedDescription
            }
        }
    }
    
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(formShowing: Binding.constant(true))
    }
}
