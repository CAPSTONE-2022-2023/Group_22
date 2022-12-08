//
//  ProfileView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-12-07.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = "";
    @State private var surname: String = "";
    @State private var email: String = "";
    @State private var phoneNumber: String = "";
    @State private var isUpdated: Bool = false;
    
    var body: some View {
        ZStack{
            Color(red: 255 / 255, green: 250 / 255, blue: 240 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // MARK: User Picture
                VStack{
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .frame(width: 150, height: 150)
                    
                    Text(self.email)
                        .foregroundColor(.secondary)
                        .bold()
                        .padding(.top)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: Name
                VStack(alignment: .leading) {
                    Text("Name")
                        .bold()
                    
                    TextField(self.name, text: self.$name)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                    
                }
                .padding(.horizontal)
                
                // MARK: Surname
                VStack(alignment: .leading) {
                    Text("Surname")
                        .bold()
                    
                    TextField(self.surname, text: self.$surname)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding(.horizontal)
                
                // MARK: Phone Number
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .bold()
                    
                    TextField(self.phoneNumber, text: self.$phoneNumber)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    // submit
                    let fb = FirebaseManager.shared
                    if let user_id = fb.auth.currentUser?.uid{
                        fb.firestoreDB
                            .collection("CustomersInfo")
                            .document(user_id)
                            .updateData([
                                "name": self.name,
                                "surname": self.surname,
                                "phoneNumber": self.phoneNumber
                            ]) { error in
                                if let err = error {
                                    print(err.localizedDescription)
                                }
                                else {
                                    print("Updated user info")
                                    self.isUpdated.toggle()
                                }
                            }
                        
                    }
                    
                } label: {
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: 150)
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding()
                
                Spacer()
            }
            .alert("User info successfully updated!", isPresented: self.$isUpdated) {
                Button("Ok", role: .cancel){}
            }
        }
        .navigationTitle("Profile")
        .onAppear{
            if let user_id = FirebaseManager.shared.auth.currentUser?.uid{
            FirebaseManager.shared.firestoreDB
                .collection("CustomersInfo")
                .document(user_id)
                .getDocument { doc, error in
                    if let err = error {
                        print(err.localizedDescription)
                    } else {
                        if let data = doc?.data() {
                            self.name = data["name"] as? String ?? ""
                            self.surname = data["surname"] as? String ?? ""
                            self.email = data["email"] as? String ?? ""
                            self.phoneNumber = data["phoneNumber"] as? String ?? ""
                        }
                    }
                }}
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
