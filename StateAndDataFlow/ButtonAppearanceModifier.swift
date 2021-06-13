//
//  ButtonAppearanceModifier.swift
//  StateAndDataFlow
//
//  Created by MacBook on 13.06.2021.
//

// общий кастомный модификатор для кнопки
import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
    }
}

extension Button {
    func buttonAppearance(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonAppearanceModifier(color: color)
        )
    }
}

