//
//  APButton.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 03/07/25.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "Test Title")
}
