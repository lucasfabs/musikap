//
//  AlbumInfoContainer.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct AlbumInfoContainer: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundStyle(.yellow)
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(value)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

