//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init () {}
    
    func save () {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: date.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
