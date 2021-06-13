//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

// Инициализировать имя и уст без иниц
import Combine

class UserManager: ObservableObject {
    //@Published - следит за свойством
    // экз модели
    @Published var user = User()
    
    // проверяет текстовое поле  
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

// модель
struct User: Codable {
    var name = ""
    // при запуске прилож если false то откр экр логина если true то второй экран
    var isRegistered = false
}
