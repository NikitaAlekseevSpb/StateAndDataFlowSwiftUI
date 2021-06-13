//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userManager: UserManager
    //StateObject что бы следить за изм (подписан на класс таймкоунтр)
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 70)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(title: timer.buttonTitle, color: .red, action: timer.startTimer)
            Spacer()
            ButtonView(title: "LogOut", color: .blue){
                StorageManager.shared.deleteUser(userManager: userManager)
            }
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

