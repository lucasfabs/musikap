//
//  AlbumHeaderSection.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct AlbumHeaderSection: View {
    let title: String
    let artist: String
    let isFavorite: Bool
    let onFavoriteTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .lineLimit(3)
            
            Text(artist)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            
            Button(action: onFavoriteTap) {
                HStack {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                    Text(isFavorite ? "Retirer des favoris" : "Ajouter aux favoris")
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isFavorite ? Color.red : Color.blue)
                .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

