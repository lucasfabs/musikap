//
//  CardTitlePrimary.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 04/11/2025.
//


import SwiftUI

public struct CardTitlePrimary: View {
    let label: String
    let action: () -> Void

    public init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Text(label)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .padding(.bottom, 6)
            .foregroundStyle(Color.blackPrimary)
            .onTapGesture {
                action()
            }
    }
}

extension Color {
    static let blackPrimary: Color = Color("BlackPrimary", bundle: .module)
}
