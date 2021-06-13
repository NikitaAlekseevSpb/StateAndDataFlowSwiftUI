//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

// Структура которая опр какой экран включить
// исп в StateAndDataFlowApp файле 

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userManager: UserManager
    
    
    var body: some View {
        // Group контейнер 
        Group {
            if userManager.user.isRegistered {
                ContentView()
            } else {
                RegisterView()
                   
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
