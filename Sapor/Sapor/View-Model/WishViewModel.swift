import Foundation
import FirebaseFirestore
import FirebaseAuth

class WishViewModel: ObservableObject {
    @Published var wishlist: [String] = []
    @Published var items: [Item] = []
    
    private var db = Firestore.firestore()
    private var userId: String? {
        return Auth.auth().currentUser?.uid
    }
    
    private var listenerRegistration: ListenerRegistration?
    
    static let shared = WishViewModel()
    
    private init() {
        print("Loaded wishlist")
        guard let userId = self.userId else {
            print("User is not authenticated")
            return
        }
        
        let docRef = db.collection("Wishlist").document(userId)
        listenerRegistration = docRef.addSnapshotListener { [weak self] documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            
            guard let data = document.data(), let wishlist = data["wishlist"] as? [String] else {
                print("Document data was empty.")
                return
            }
            print("THE DATA HERE:")

            var counter = 0
            for each in document.data()!{
                print(counter)
                print(each)
                counter += 1
            }
            DispatchQueue.main.async {
                print("loading the list thorugh snapshot listener")
                self?.wishlist = wishlist
            }
        }
    }
    
    
    func removeItem(name: String) {
        wishlist.removeAll { $0 == name }
        persistInFirebase()
    }
    
    func addItem(name: String) {
        guard !wishlist.contains(where: { str in
            str == name;
        }) else { return }
        wishlist.append(name)
        persistInFirebase()
    }
    
    func persistInFirebase() {
        guard let userId = self.userId else {
            print("User is not authenticated")
            return
        }
        
        db.collection("Wishlist").document(userId).setData(["wishlist": wishlist]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
        
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
            self.items = []
            documents.documents.forEach { each in
                let name = each["name"] as! String
                let price = each["price"] as! String
                let category = each["category"] as! String
                let description = each["description"] as! String
                let imageURL = each["imageURL"] as! String
                    for item in self.wishlist {
                        if item == name {
                            print("\(item) and \(name)")
                            self.items.append(.init(name: name, price: price, description: description, category: category, imageURL: imageURL))
                            break
                        }
                    }

            }
        })
        
        
    }
    
    deinit {
        listenerRegistration?.remove()
    }
}
