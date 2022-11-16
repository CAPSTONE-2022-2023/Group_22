//
//  WelcomeView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI
// 253, 251, 247
struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isSignInDisplayed: Bool = false
    @State var isSignUpDisplayed: Bool = false

    var body: some View {
        
        VStack() {
            Image("chicken_dish")
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
            
            
            VStack(spacing: 5){
                Text("It's not just food")
                
                Text("It's an experience")
            }
            .fontWeight(.heavy)
            .font(.title)
            .padding()
            
            Text("Cooked with love for you")
                .font(.subheadline)
                .padding(.horizontal)
                .bold()
                .foregroundColor(.gray)
            
            Spacer()
            
            
            // Orange Button
            Button {
                print("Clicked")
                presentationMode.wrappedValue.dismiss()
                isSignInDisplayed.toggle()
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
                    print("Sign up")
                    presentationMode.wrappedValue.dismiss()
                    isSignUpDisplayed.toggle()
                } label: {
                    Text("Sign up")
                        .foregroundColor(.gray)
                        .bold()
                }
                
            }
            
        }
        .background(Color(red: 255 / 255, green: 250 / 255, blue: 240 / 255))

        .fullScreenCover(isPresented: $isSignInDisplayed, content: {
            SignInView()
        })
        .fullScreenCover(isPresented: $isSignUpDisplayed) {
            SignUpView()
        }

    }
        
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
