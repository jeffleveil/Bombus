//
//  BombusTimerTextModifier.swift
//  Bombus
//
//  Created by Yon Montoto on 3/18/21.
//

import SwiftUI

struct BombusTimerTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60, weight: .bold, design: .rounded))
            .padding(50)
            .foregroundColor(.bombusPrimaryTextColor)
    }
}

extension View {
    func timerTextStyle() -> ModifiedContent<Self, BombusTimerTextModifier> {
        return modifier(BombusTimerTextModifier())
    }
}

struct BombusTimerTextModifierPreview: PreviewProvider {
    static var previews: some View {

        Group {
            
            Text("This is a primary button")
                .timerTextStyle()
        }
    }
}
