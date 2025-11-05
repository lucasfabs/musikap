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
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

