//
//  StatCard.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

public struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    
    public init(title: String, value: String, icon: String) {
        self.title = title
        self.value = value
        self.icon = icon
    }
    
    public var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundStyle(.blue)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                
                Text(value)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}
