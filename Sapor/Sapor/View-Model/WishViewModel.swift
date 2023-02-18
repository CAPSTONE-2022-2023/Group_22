import Foundation
import FirebaseFirestore
import FirebaseAuth

class WishViewModel: ObservableObject {
    @Published var wishlist: [String] = []
    
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
        
        let docRef = db.collection("users").document(userId)
        listenerRegistration = docRef.addSnapshotListener { [weak self] documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            
            guard let data = document.data(), let wishlist = data["wishlist"] as? [String] else {
                print("Document data was empty.")
                return
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
        
        db.collection("users").document(userId).setData(["wishlist": wishlist]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    deinit {
        listenerRegistration?.remove()
    }
}
