//
//  FavoriteAlbumList.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct FavoriteAlbumsList: View {
    let albums: [Album]
    let onRemove: (Album) -> Void
    
    var body: some View {
        ForEach(albums) { album in
            HStack {
                AlbumCard(
                    imageURL: album.imageURL,
                    title: album.name,
                    subtitle: album.artist
                ) {
                    // Action
                }
                
                Button(action: {
                    onRemove(album)
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                        .font(.system(size: 20))
                }
                .padding(.trailing)
            }
        }
    }
}
