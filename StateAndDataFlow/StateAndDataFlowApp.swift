//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Nikita Alekseev on 08.06.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    
    // созд источник данных что бы передать в вью
    @StateObject private var userManager = UserManager(user: StorageManager.shared.fetchContacts())
    
    var body: some Scene {
        WindowGroup {
            StarterView()// вызвать что бы опр какую вью загружать
                .environmentObject(userManager)// передача обьекта
                
        }
    }
}
