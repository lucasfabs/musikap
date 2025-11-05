//
//  AlbumCoverSection.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct AlbumCoverSection: View {
    let imageURL: String?
    
    var body: some View {
        VStack {
            if let imageURL = imageURL, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                }
                .frame(width: .infinity)
                .cornerRadius(24)
                .shadow(radius: 10)
            } else {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: .infinity)
                    .cornerRadius(24)
                    .overlay(
                        Image(systemName: "music.note")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)
                    )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
