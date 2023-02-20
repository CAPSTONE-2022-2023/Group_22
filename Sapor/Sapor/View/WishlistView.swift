//
//  WishlistView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2023-02-18.
//

import SwiftUI

struct WishlistView: View {
    @ObservedObject var vm: WishViewModel = .shared
    
    init() {
        print("Wishlist View")
    }
    
    var body: some View {
        Group {
            if !vm.items.isEmpty {
                ScrollView(.vertical){
                    VStack(spacing: 30){
                        ForEach(self.vm.items, id: \.self) { item in
                            HStack(){
                                // MARK: Item Description
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text(item.name)
                                            .font(.body)
                                            .bold()
                                        Spacer()
                                        let has = vm.wishlist.contains { str in
                                            str == item.name;
                                        };
                                        Button {
                                            if !has {
                                                vm.addItem(name: item.name)
                                            } else {
                                                vm.removeItem(name: item.name)
                                                vm.items.removeAll { i in
                                                    i.name == item.name
                                                }
                                            }
                                        } label: {
                                            Image(systemName: has ? "heart.fill" : "heart").foregroundColor(.orange)
                                        }
                                        
                                        Button {
                                            // TODO: add to basket
                                            //                                    menu.addToBasket(item:item)
                                        } label: {
                                            Image(systemName: "cart.fill.badge.plus").foregroundColor(.orange)
                                        }
                                        
                                    }
                                    Text("$\(item.price)")
                                        .font(.subheadline)
                                    
                                    Text(item.description)
                                        .font(.callout)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                // MARK: Item Image
                                AsyncImage(url: URL(string: item.imageURL)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            } else {
                Text("When you like an item it will be displayed here")
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            print("ITEMS")
            vm.fetchItems()
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
