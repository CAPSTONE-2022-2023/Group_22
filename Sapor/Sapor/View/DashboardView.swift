//
//  DashboardView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI

struct DashboardView: View {
    @State private var isDeleteAccountTapped = false;
    
    var body: some View {
        NavigationView {
            List{
                Section{
                    NavigationLink(destination: ProfileView()){
                        HStack(spacing: 20){
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                            
                            Text(FirebaseManager.shared.auth.currentUser?.email ?? "Email Address")
                        }
                    }
                }
                
                Section{
                    HStack(spacing: 15){
                        Image(systemName: "creditcard.fill")
                        Text("Wallet")
                    }
                    
                    HStack(spacing: 15){
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                        Text("Order History")
                    }
                    
                    NavigationLink(destination: WishlistView()) {
                        HStack(spacing: 15){
                            Image(systemName: "heart.fill")
                            Text("Favourites")
                            
                        }
                    }
                    HStack(spacing: 15){
                        Image(systemName: "questionmark.circle.fill")
                        Text("Help")
                        
                    }
                    
                    HStack(spacing: 15){
                        Image(systemName: "exclamationmark.bubble.circle.fill")
                        Text("About")
                        
                    }
                }
                
                Section {
                    Button {
                        print("Delete")
                        self.isDeleteAccountTapped.toggle();
                        
                    } label: {
                            Text("Delete Account")
                            .foregroundColor(.red)
                    }
                }
                
                Section{
                    Button {
                        print("sign out")
                        
                    } label: {
                        HStack(spacing: 20) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Sign out")
                        }
                        .foregroundColor(.primary)
                    }
                    
                }
            }
        }
        .confirmationDialog("Delete Account", isPresented: self.$isDeleteAccountTapped) {
            Button("Delete", role: .destructive) {
                FirebaseManager.shared.auth.currentUser?.delete(completion: { error in
                    if let err = error {
                        print(err.localizedDescription)
                    } else {
                        print("Deleted")
                    }
                })
            }
            
            Button("Cancel", role: .cancel) {
                print("Cancel clicked")
            }
        } message: {
            Text("Are you sure you want to delete your account?")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
