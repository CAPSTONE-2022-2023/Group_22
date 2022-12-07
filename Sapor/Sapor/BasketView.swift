//
//  BasketView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-12-06.
//

import SwiftUI

struct BasketItem: Hashable {
    let name: String;
    let category: String;
    let price: Double;
    let qty: Int;
    let imageURL: String;
}


struct BasketView: View {
    @State private var basketItems: [BasketItem] = [
        BasketItem(name: "Rigatoni", category: "Pasta", price: 24.9, qty: 1, imageURL: "https://firebasestorage.googleapis.com/v0/b/sapor-e45c1.appspot.com/o/rigatoni.jpg?alt=media&token=99e2f1b5-89ae-49ca-83a5-8e849ecf6c81"),
        BasketItem(name: "Penne", category: "Pasta", price: 24.9, qty: 1, imageURL: "https://firebasestorage.googleapis.com/v0/b/sapor-e45c1.appspot.com/o/rigatoni.jpg?alt=media&token=99e2f1b5-89ae-49ca-83a5-8e849ecf6c81"),
        BasketItem(name: "Hot dog", category: "Pasta", price: 24.9, qty: 1, imageURL: "https://firebasestorage.googleapis.com/v0/b/sapor-e45c1.appspot.com/o/rigatoni.jpg?alt=media&token=99e2f1b5-89ae-49ca-83a5-8e849ecf6c81"),
        BasketItem(name: "special salad", category: "Pasta", price: 24.9, qty: 1, imageURL: "https://firebasestorage.googleapis.com/v0/b/sapor-e45c1.appspot.com/o/rigatoni.jpg?alt=media&token=99e2f1b5-89ae-49ca-83a5-8e849ecf6c81"),
        BasketItem(name: "Coca cola", category: "Pasta", price: 24.9, qty: 1, imageURL: "https://firebasestorage.googleapis.com/v0/b/sapor-e45c1.appspot.com/o/rigatoni.jpg?alt=media&token=99e2f1b5-89ae-49ca-83a5-8e849ecf6c81")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack{
                    ForEach(basketItems, id: \.self) { item in
                        HStack{
                            // MARK: Image
                            AsyncImage(url: URL(string: item.imageURL)) { image in
                                image.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            // MARK: Middle VStack
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .bold()
                                
                                Text(item.category)
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                Spacer()
                                HStack(spacing: 10){
                                    Image(systemName: "minus")
                                        .onTapGesture {
                                            // decrement
                                        }
                                        
                                    
                                    Text("\(item.qty)")
                                    
                                    Image(systemName: "plus")
                                        .onTapGesture {
                                            // increment
                                        }
                                }
                            }
                            Spacer()
                            VStack(alignment: .trailing){
                                Button {
                                    print(item.hashValue)
                                    self.basketItems.removeAll { _item in
                                        _item.hashValue == item.hashValue
                                    }
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.primary)
                                }
                                
                                
                                Spacer()
                                Text(String(format: "$%.2f", item.price))
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding()
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
                .navigationTitle("Basket")
            }
            .overlay(alignment: .bottom, content: {
                Button {
                    print("Check out tapped")
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(height: 60)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 40)
                        .shadow(radius: 5)
                        .overlay {
                            Text("Check out")
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                }
            })
            
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
