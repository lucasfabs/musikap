//
//  AlbumListSection.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct AlbumListSection: View {
    let title: String
    let albums: [Album]
    let onAlbumTap: (Album) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            ForEach(albums) { album in
                AlbumCard(
                    imageURL: album.imageURL,
                    title: album.name,
                    subtitle: album.artist
                ) {
                    onAlbumTap(album)
                }
            }
        }
        .padding(.horizontal, 14)
    }
}
