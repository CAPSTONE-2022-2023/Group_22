//
//  BasketViewModel.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2023-02-18.
//

import Foundation

class BasketViewModel: ObservableObject {
	@Published var items = [BasketItem]()
	
	@Published private(set) var products: [BasketItem]  = []
	@Published private(set) var total: Double = 0.0
	@Published private(set) var temp: String = ""
	
	let paymentHandler = PaymentHandler()
	@Published var paymentSuccess = false
	// Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
	
    static let shared = BasketViewModel()
    
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
				// reset total to 0.0
				self.total = 0.0
				
				var _items = [BasketItem]()
				documents.documents.forEach { each in
					let name = each["name"] as! String
					let price = each["price"] as! String
					let imageURL = each["imageURL"] as! String
					let category = each["category"] as! String
					let qty = each["quantity"] as! Int
					print("\(name) added to basket items")
					_items.append(BasketItem(name: name, category: category, price: price, qty: qty, imageURL: imageURL))
					
					// Update subtotal from newly fetched data
					let dprice = (price as NSString).doubleValue
					self.total += Double(qty) * dprice
					print("The Current Subtotal is $\(self.total)" )
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
    
    func clearBasket(){
        for item in self.items{
            if let uid = FirebaseManager.shared.auth.currentUser?.uid {
                let shopping_cart = FirebaseManager.shared.firestoreDB
                    .collection("Shopping_Cart")
                    .document(uid)
                    .collection("basket")
                shopping_cart.document(item.name).delete()
            }
        }
    }
	
	func pay() {
		paymentHandler.startPayment(products: products, total: total) { success in
			self.paymentSuccess = success
            print("Clearing basket")
            print("Paid")
            
            self.clearBasket()
			self.products = []
			self.total = 0.0
		}
	}
	
}
