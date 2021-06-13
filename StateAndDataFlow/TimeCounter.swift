//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

// настройка таймера и кнопки
// передача данных счетчика каждую секунду

//изм имени кнопки в зависимости от таймера

import Foundation
// для того что бы подписать на ObservableObject импорт комбайн
import Combine

class TimeCounter: ObservableObject {
    //свойство objectWillChange протокола паблишер (издатель)- уведомляет
    //подписчиков  о изм состояния (отправляет число счетчика)
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3 // счетчик
    var timer: Timer? // таймер
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 { // проверка запуска таймера 
            timer = Timer.scheduledTimer( // scheduledTimer - расписание таймера
                timeInterval: 1, // каждую сек
                target: self,
                selector: #selector(updateCounter), // вызыв метода для таймера
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    //метод для таймера
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            // когда таймер выключается
            buttonTitle = "Reset"
        }
        // отправляем изм счетчика
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // опр название кнопки
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        // отпр изменения имени кнопки
        objectWillChange.send(self)
    }
}
