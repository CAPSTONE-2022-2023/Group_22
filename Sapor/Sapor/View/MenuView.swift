//
//  MenuView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI






struct MenuView: View {
    @State private var searchTerm: String = "";
    private var categories: [String] = ["Sandwich", "Pasta", "Soup", "Salad", "Drink"]
    @State private var selectedCategory: String = "Sandwich";
    @ObservedObject var vm = MenuViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                // MARK: Search Bar
                HStack(spacing: 20){
                    TextField("Search", text: self.$searchTerm)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                    Button {
                        // process search
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 27)
                            .foregroundColor(.orange)
                    }
                }.padding(.horizontal)
                
                // MARK: Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30){
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .foregroundColor(category == self.selectedCategory ? .primary : .gray)
                                .bold()
                                .underline(category == self.selectedCategory, color: .orange)
                                .onTapGesture {
                                    self.selectedCategory = category
                                }
                            
                        }
                    }.padding(.horizontal)
                }
                .padding(.vertical, 40)
                
                // MARK: Menu Items
                ScrollView(.vertical){
                    VStack(spacing: 30){
                        ForEach(self.vm.items.filter({ item in
                            item.category == selectedCategory
                        }), id: \.self) { item in
                            HStack(){
                                // MARK: Item Description
                                VStack(alignment: .leading, spacing: 10){
                                    Text(item.name)
                                        .font(.body)
                                        .bold()
                                        
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
            }
            .navigationTitle("Menu")
            // delete later
            .onAppear{
                print("appeared")
                for item in self.vm.items {
                    print(item.name)
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
