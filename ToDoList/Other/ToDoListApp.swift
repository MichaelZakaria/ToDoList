//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
