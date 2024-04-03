//
//  RegisterView.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack {
                    // Header
                    HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, background: .orange)
                    
                    // Register form
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Full Name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        
                        TextField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                        
                        TLButton(title: "Create Account", background: .green) {
                            viewModel.register()
                        }
                        .padding(10)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 320)
                    .scrollDisabled(true)
                    .offset(y: -50)
                    
                    Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
