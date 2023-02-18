import SwiftUI


class MenuViewModel: ObservableObject {
    @Published var items = [Item]()
    
    
    init(){
        fetchItems()
    }
    
    func fetchItems() {
        FirebaseManager.shared.firestoreDB.collection("Menu_Items").getDocuments(completion: { querySnapshot, err in
            if let e = err {
                print(e.localizedDescription)
            }
            
            guard let documents = querySnapshot else {
                print("No documents")
                return;
            }
            
            documents.documents.forEach { each in
                let name = each["name"] as! String
                let price = each["price"] as! String
                let category = each["category"] as! String
                let description = each["description"] as! String
                let imageURL = each["imageURL"] as! String
                self.items.append(.init(name: name, price: price, description: description, category: category, imageURL: imageURL))
            }
        })
    }
    
    func addToBasket(item:Item){
        print("addToBasket")
        if let uid = FirebaseManager.shared.auth.currentUser?.uid {
            let shopping_cart = FirebaseManager.shared.firestoreDB
                .collection("Shopping_Cart")
                .document(uid)
                .collection("basket")
                .document(item.name)
            
            shopping_cart.getDocument(completion: { query, err in
                if let _ = err {
                    print("Error")
                }
                
                if let document = query?.data() {
                    print("Exists")
                    return
                }
                print("Doesn't exist")
                shopping_cart.setData(["name" : item.name,
                                       "price" : item.price,
                                       "quantity": 1,
                                       "category": item.category,
                                       "imageURL": item.imageURL
                                      ])
                
            })
            
        }
    }
}
