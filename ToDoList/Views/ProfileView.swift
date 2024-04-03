//
//  ProfileView.swift
//  ToDoList
//
//  Created by Marco Zakaria on 30/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info
        VStack(alignment: .leading) {
            /// Name
            HStack {
                Text("Name")
                    .bold()
                Text(user.name)
            }
            .padding()
            /// Email
            HStack {
                Text("Email")
                    .bold()
                Text(user.email)
            }
            .padding()
            /// Member since
            HStack {
                Text("Member since")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        // Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding(.top, 80)
    }
}

#Preview {
    ProfileView()
}
