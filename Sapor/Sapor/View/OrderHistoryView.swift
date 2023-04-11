//
//  OrderHistoryView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2023-04-07.
//

import SwiftUI

struct PastOrderView: View {
    let items: [String]
    let uuid: String;
    @ObservedObject var basket = BasketViewModel.shared
    @ObservedObject var vm = OrderHistoryViewModel.shared
    @ObservedObject var menu = MenuViewModel()
    
    var body: some View {
        List{
            ForEach(items, id: \.self) {item in
                Text(item)
            }
        }
        Button {
            replace()
        } label: {
            RoundedRectangle(cornerRadius: 50)
                .frame(height: 60)
                .foregroundColor(.orange)
                .padding(.horizontal, 40)
                .shadow(radius: 5)
                .overlay {
                    Text("Replace")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.vertical)
        }
        
    }
    
    func replace(){
        // empty the basket and add these items to the basket
        basket.clearBasket()
        if let items = self.vm.orders[uuid] {
            for item in items {
                if let found = self.menu.items.first(where: {
                    $0.name == item
                }) {
                    self.menu.addToBasket(item: found)
                } else {
                    print("Item not found, it is possible that it was deleted from the database")
                }
            }
        }
    }
}

struct OrderHistoryView: View {
    @ObservedObject var vm = OrderHistoryViewModel.shared
    
    var body: some View {
        List{
            ForEach(Array(vm.orders.keys).sorted().reversed(), id: \.self){uuid in
                NavigationLink(destination: PastOrderView(items: vm.orders[uuid]!, uuid: uuid)){
                    Text(uuid)
                }
            }
        }
        VStack{
            Button("Add out of stock items"){
                vm.addItem(items: ["Kebab", "Pizza", "Sandwich"])
            }
            
            Button("Add in stock items") {
                vm.addItem(items: ["Hamburger", "Hot Dog", "Rigatoni Bolognese"])
                
            }
        }
        .onAppear{
            print(vm.orders)
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
