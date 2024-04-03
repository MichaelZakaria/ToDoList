//
//  User.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
