//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 05/07/25.
//

import SwiftUI

struct standardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func StandardButtonStyle() -> some View {
        self.modifier(standardButtonStyle())
    }
}
