//
//  FireBaseManager.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage


class FirebaseManager: NSObject {
    let auth : Auth;
    let storage: Storage;
    let firestoreDB: Firestore;
    
    static let shared = FirebaseManager();
    
    override init(){
        FirebaseApp.configure()
        
        self.auth = Auth.auth();
        self.storage = Storage.storage();
        self.firestoreDB = Firestore.firestore()
        
        super.init()
    }
}
