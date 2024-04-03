//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!itemCopy.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
