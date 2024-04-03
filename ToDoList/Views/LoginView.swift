//
//  LoginView.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                    
                    
                    // Login Form
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                        
                        TLButton(title: "Log In", background: .blue) {
                            viewModel.login()
                        }
                        .padding(10)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                    .scrollDisabled(true)
                    .offset(y: -50)
                    
                    
                    // Creat new account
                    VStack {
                        Text("New around here?")
                        
                        NavigationLink("Creat An Account",
                                       destination: RegisterView()
                        )
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
