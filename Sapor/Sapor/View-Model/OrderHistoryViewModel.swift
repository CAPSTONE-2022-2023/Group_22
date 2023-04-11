import Foundation
import FirebaseFirestore
import FirebaseAuth

class OrderHistoryViewModel: ObservableObject {
    @Published var orders: [String: [String]] = [:]
    
    private var db = Firestore.firestore()
    private var userId: String? {
        return Auth.auth().currentUser?.uid
    }
    
    private var listenerRegistration: ListenerRegistration?
    
    static let shared = OrderHistoryViewModel()
    
    private init() {
        print("Loaded order history")
        guard let userId = self.userId else {
            print("User is not authenticated")
            return
        }
        
        let docRef = db.collection("OrderHistory").document(userId)
        listenerRegistration = docRef.addSnapshotListener { [weak self] documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                self?.orders = [:]
                return
            }
        
            guard let data = document.data(), !data.isEmpty else {
                print("OrderHistory data was empty.")
                return
            }


            DispatchQueue.main.async {
                print("loading the list thorugh snapshot listener")
                self?.orders = [:]
                for order in data {
                    self?.orders[order.key] = order.value as? [String]
                }
            }
        }
    }
    
//
//    func removeItem(name: String) {
////        wishlist.removeAll { $0 == name }
//        persistInFirebase()
//    }
//
    
    func addItem(items: [String]) {
        // works
        print("ADDING ITEMS:")
        print(items)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateString = formatter.string(from: date)
        self.orders[dateString] = items
        persistInFirebase()
    }

    func persistInFirebase() {
        // works
        print("Persisting")
        guard let userId = self.userId else {
            print("User is not authenticated")
            return
        }
        
        for (order_id, order_items) in self.orders {
            db.collection("OrderHistory").document(userId).updateData([order_id: order_items]) {
                error in
                if let error = error {
                    print("Error writing document: \(error)")
                    self.db.collection("OrderHistory").document(userId)
                        .setData([:])
                    self.orders = [:]
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    func clearItems(){
        self.orders = [:]
        persistInFirebase()
    }
//
//    func fetchItems() {
//        FirebaseManager.shared.firestoreDB.collection("Menu_Items").getDocuments(completion: { querySnapshot, err in
//            if let e = err {
//                print(e.localizedDescription)
//            }
//
//            guard let documents = querySnapshot else {
//                print("No documents")
//                return;
//            }
//            self.items = []
//            documents.documents.forEach { each in
//                let name = each["name"] as! String
//                let price = each["price"] as! String
//                let category = each["category"] as! String
//                let description = each["description"] as! String
//                let imageURL = each["imageURL"] as! String
//                    for item in self.wishlist {
//                        if item == name {
//                            print("\(item) and \(name)")
//                            self.items.append(.init(name: name, price: price, description: description, category: category, imageURL: imageURL))
//                            break
//                        }
//                    }
//
//            }
//        })
//
//
//    }
//
    deinit {
        listenerRegistration?.remove()
    }
}
