//
//  ArtistRowCard.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

public struct ArtistCard: View {
    let imageURL: String?
    let name: String
    let action: () -> Void

    public init(imageURL: String?, name: String, action: @escaping () -> Void) {
        self.imageURL = imageURL
        self.name = name
        self.action = action
    }

    public var body: some View {
        HStack(spacing: 12) {
            if let urlString = imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .overlay(
                            ProgressView()
                        )
                }
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            } else {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.gray)
                    )
            }
            
            VStack(alignment: .leading, spacing: 4) {
                CardTitlePrimary(label: name) {
                    action()
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
