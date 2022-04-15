//
//  LoginView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-04-15.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var loginMode = Constants.LoginMode.login
    
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    var buttonText: String {
        if loginMode == Constants.LoginMode.login {
            return "Login"
        } else {
            return "Sign up"
        }
    }
    
    var body: some View {
        VStack (spacing: 20){
            
            Spacer()
            // Logo
            Image(systemName:  "book")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150)
            // Title
            Text("Bee the Cook")
            
            Spacer()
            
            Picker (selection: $loginMode, label: Text("Picker"), content: {
                Text("Login")
                    .tag(Constants.LoginMode.login)
                Text("Sign up")
                    .tag(Constants.LoginMode.createAccount)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            Section {
                if loginMode == Constants.LoginMode.createAccount {
                    TextField("User Name", text: $userName)
                }
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            if errorMessage != nil {
                Section {
                    Text(errorMessage!)
                }
            }
            Button {
                if loginMode == Constants.LoginMode.login {
                    // Log the uer in
                    signIn()
                } else {
                    createAccount()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 40)
                        .cornerRadius(10)
                    Text(buttonText)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
        }
        .padding(.horizontal, 40)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                errorMessage = error!.localizedDescription
            }
        }
    }
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            //May need DispatchQueue.main.async {}
            if error != nil {
                errorMessage = error?.localizedDescription
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
