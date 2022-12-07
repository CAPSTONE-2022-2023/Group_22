//
//  DashboardView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            List{
                Section{
                    HStack(spacing: 20){
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            
                        
                        Text(FirebaseManager.shared.auth.currentUser?.email ?? "Email Address")
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
                    
                    HStack(spacing: 15){
                        Image(systemName: "heart.fill")
                        Text("Favourites")

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
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
