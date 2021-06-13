//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by MacBook on 12.06.2021.
//

import Foundation
import Combine


// синглтон
class StorageManager: ObservableObject {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "userManager"
    
    private init() {}
    
    func save(user: User) {
          // получ дата для того что бы сохр
       guard let data = try? JSONEncoder().encode(user) else { return }
        // сохр в userDefault
          userDefaults.set(data, forKey: key)
       
    }
    
    func fetchContacts() -> User {
     // проверить есть ли там ранее сохр данные если нет то []
     // экз обьекта сохр с типом Data поэтому нужно восстановить обьект
     // с типом Data
         guard let data = userDefaults.object(forKey: key) as? Data else { return User() }
          // парсим дата с моделью ()
        guard let user = try? JSONDecoder().decode(User.self, from: data) else { return User() }
        return user
    }
    // удаление данных
    func deleteUser(userManager: UserManager) {
        // уст флаг регистрации 
        userManager.user.isRegistered = false
        userManager.user.name = ""
        // удаление имени 
        userDefaults.removeObject(forKey: key)
    }
}
