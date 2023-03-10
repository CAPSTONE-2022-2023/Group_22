//
//  BasketViewModel.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2023-02-18.
//

import Foundation

class BasketViewModel: ObservableObject {
    @Published var items = [BasketItem]()
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        print("Fetch items function")
        if let uid = FirebaseManager.shared.auth.currentUser?.uid {
            let shopping_cart = FirebaseManager.shared.firestoreDB
                .collection("Shopping_Cart")
                .document(uid)
                .collection("basket")
            shopping_cart.addSnapshotListener({ query, err in
                if let e = err {
                    print(e.localizedDescription)
                }
                
                guard let documents = query else {
                    print("No documents")
                    return;
                }
                var _items = [BasketItem]()
                documents.documents.forEach { each in
                    let name = each["name"] as! String
                    let price = each["price"] as! String
                    let imageURL = each["imageURL"] as! String
                    let category = each["category"] as! String
                    let qty = each["quantity"] as! Int
                    print("\(name) added to basket items")
                    _items.append(BasketItem(name: name, category: category, price: price, qty: qty, imageURL: imageURL))
                }
                self.items = _items
                
            })
        }
    }
    
    func deleteItem(item: BasketItem) {
        if let uid = FirebaseManager.shared.auth.currentUser?.uid {
            let shopping_cart = FirebaseManager.shared.firestoreDB
                .collection("Shopping_Cart")
                .document(uid)
                .collection("basket")
            shopping_cart.document(item.name).delete()
        }
    }
    
    func increment(qty: Int, item: BasketItem) {
        if item.qty + qty == 0 {
            deleteItem(item: item)
            return
        }
        if let uid = FirebaseManager.shared.auth.currentUser?.uid {
            let shopping_cart = FirebaseManager.shared.firestoreDB
                .collection("Shopping_Cart")
                .document(uid)
                .collection("basket")
            shopping_cart.document(item.name).updateData(["quantity": item.qty + qty])
            print("Updated quantity")
        }
    }
    
}
