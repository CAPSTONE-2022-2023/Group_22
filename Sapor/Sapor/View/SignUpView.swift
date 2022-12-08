//
//  SignUpView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode;
    
    @State var isSignInDisplayed: Bool = false;
    
    @State private var email: String = "";
    @State private var password: String = "";
    @State private var confirm_password: String = "";
    @State private var alertMessage: String = "";
    @State private var showAlert: Bool = false;
    @State private var showDashboard: Bool = false;
    
    var body: some View {
        // main VStack
        VStack() {
            // image
            Image("meat_dish")
                .resizable()
                .scaledToFit()
                .padding()
                        
            // Sign up Vstack
            VStack(alignment: .leading, spacing: 5){
                // title
                Text("Sign Up")
                    .bold()
                    .font(.largeTitle)
                    .padding(.horizontal)
                // MARK: - Email Text Field
                VStack(alignment: .leading){
                    // email
                    Text("Email")
                        .font(.callout)
                        .bold()
                    
                    TextField("Enter email ...", text: self.$email)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }.padding()
                // MARK: - Password Text Field
                VStack(alignment: .leading){
                    Text("Password")
                        .font(.callout)
                        .bold()
                    
                    SecureField("Enter password ...", text: self.$password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                }.padding()
                
                // MARK: - Confirm Password Text Field
                VStack(alignment: .leading){
                    Text("Confirm Password")
                        .font(.callout)
                        .bold()
                    
                    SecureField("Re-enter password ...", text: self.$confirm_password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                }.padding()
            }
            .padding()

            
            Spacer()
            
            // Orange Button
            Button {
                print("Submitted")
                self.createAccount()
            } label: {
                Text("Sign up")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(.orange)
                    .clipShape(Capsule())
                    .font(.headline)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)

            
            HStack() {
                Text("Already have an account?")
                Button {
                    self.isSignInDisplayed.toggle()
                } label: {
                    Text("Sign in")
                        .foregroundColor(.gray)
                        .bold()
                }
                
            }
            
        }
        .background(Color(red: 255 / 255, green: 250 / 255, blue: 240 / 255))
        .fullScreenCover(isPresented: self.$isSignInDisplayed) {
            SignInView()
        }
        .fullScreenCover(isPresented: self.$showDashboard) {
            MainView()
        }
        .alert(self.alertMessage, isPresented: self.$showAlert) {
            Button("Ok", role: .cancel){}
        }
    }
    
    
    func createAccount(){
        if password == confirm_password {
            FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password){authRes, error in
                if let err = error {
                    self.alertMessage = err.localizedDescription
                    self.showAlert.toggle()
                } else {
                    if let user_id = FirebaseManager.shared.auth.currentUser?.uid {
                        FirebaseManager
                            .shared
                            .firestoreDB
                            .collection("CustomersInfo")
                            .document(user_id)
                            .setData([
                                "name": "",
                                "surname": "",
                                "phoneNumber": "",
                                "email": self.email]
                            )
                        print("crated a document")
                    }
                    
                    
                    // TODO: - redirect to dashboard
                    self.showDashboard.toggle()
                }
                
            }
        } else {
            self.alertMessage = "The passwords don't match.";
            self.showAlert.toggle();
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
