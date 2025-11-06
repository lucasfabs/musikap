//
//  StatContainer.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct StatContainer: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.accent)
                
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(Color.blackSecondary)
            }
            Text(value)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

