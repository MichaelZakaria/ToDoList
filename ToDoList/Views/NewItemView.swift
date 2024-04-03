//
//  NewItemView.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
        }
        
        Form {
            // Title
            TextField("Title", text: $viewModel.title)
                .textFieldStyle(DefaultTextFieldStyle())
            
            // Due Date
            DatePicker("Due Date", selection: $viewModel.date)
                .datePickerStyle(GraphicalDatePickerStyle())
            
            // Button
            TLButton(
                title: "Save",
                background: .pink,
                action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
            )
                .padding()
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"),
                  message: Text("Please make sure to enter a title and select a valid due date")
            )
        })
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
