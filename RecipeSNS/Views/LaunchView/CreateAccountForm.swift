//
//  CreateAccountForm.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-03-22.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountForm: View {
    
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    @Binding var formShowing: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("User Name", text: $userName)
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button {
                    // Create Account
                    createAccount()
                } label: {
                    HStack {
                        Spacer()
                        Text("Create Account")
                        Spacer()
                    }
                }

            }
            .navigationBarTitle("Create an Account")
        }
    }
    
    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                formShowing = false
            } else {
                errorMessage = error!.localizedDescription
            }
        }
    }
}

struct CreateAccountForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountForm(formShowing: Binding.constant(true))
    }
}
