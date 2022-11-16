//
//  SignInView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isSignUpDisplayed: Bool = false
    @State private var email: String =  "";
    @State private var password: String = "";
    
    @State private var showDashboard: Bool = false;
    @State private var showAlert: Bool = false;
    @State private var alertMessage: String = "";
    

    var body: some View {
        VStack() {
            Image("pasta_dish")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
            VStack(alignment: .leading, spacing: 20){
                Text("Sign In")
                    .bold()
                    .font(.largeTitle)
                
                // MARK: - Email Text Field
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.callout)
                        .bold()
                    
                    TextField("Enter email ...", text: self.$email)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                // MARK: - Password Text Field
                VStack(alignment: .leading){
                    Text("Password")
                        .font(.callout)
                        .bold()
                    
                    SecureField("Enter password ...", text: self.$password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                }
            }
            .padding(.horizontal, 30)

            
            Spacer()
            
            // Orange Button
            Button {
                self.signIn()
            } label: {
                Text("Sign in")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(.orange)
                    .clipShape(Capsule())
                    .font(.headline)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)

            
            HStack() {
                Text("Don't have an account?")
                Button {
                    self.isSignUpDisplayed.toggle()
                } label: {
                    Text("Sign up")
                        .foregroundColor(.gray)
                        .bold()
                }
                
            }
            
        }
        .background(Color(red: 255 / 255, green: 250 / 255, blue: 240 / 255))
        .fullScreenCover(isPresented: self.$isSignUpDisplayed) {
            SignUpView()
        }
        .fullScreenCover(isPresented: self.$showDashboard) {
            MainView()
        }
        .alert(self.alertMessage, isPresented: self.$showAlert) {
            Button("Ok", role: .cancel){}
        }
    
    }
    
    func signIn(){
        FirebaseManager.shared.auth.signIn(withEmail: self.email, password: self.password){
            authRes, error in
            if let err = error {
                self.alertMessage = err.localizedDescription
                self.showAlert.toggle()
            } else {
                self.showDashboard.toggle()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
