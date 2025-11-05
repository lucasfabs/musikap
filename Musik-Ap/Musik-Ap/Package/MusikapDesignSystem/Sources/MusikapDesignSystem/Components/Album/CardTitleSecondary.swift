//
//  CardTitleSecondary.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 04/11/2025.
//



import SwiftUI

public struct CardTitleSecondary: View {
    let label: String
    let action: () -> Void

    public init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Text(label)
            .font(.system(size: 14))
            .foregroundStyle(.gray)
            .onTapGesture {
                action()
            }
            .fontWeight(.medium)
    }
}
