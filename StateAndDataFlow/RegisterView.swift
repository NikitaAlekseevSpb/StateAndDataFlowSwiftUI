//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

// Созд экрана логина

import SwiftUI

struct RegisterView: View {

    // @EnvironmentObject  связ с @Published 
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                // передает сразу в userManager
                TextFieldRegister(
                    name: $userManager.user.name,
                    nameIsValid: userManager.nameIsValid
                )
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }.disabled(!userManager.nameIsValid)
            }
        }
    }
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            StorageManager.shared.save(user: userManager.user)
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct TextFieldRegister: View {
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
           
    }
}
