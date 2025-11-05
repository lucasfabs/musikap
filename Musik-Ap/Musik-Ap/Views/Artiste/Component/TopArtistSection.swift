//
//  TopArtistSection.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//
import SwiftUI
import MusikapDesignSystem

struct TopArtistSection: View {
    let artists: [Artist]
    let title: String
    let onArtistTap: (Artist) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Top 25")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ForEach(artists) { artist in
                ArtistCard(
                    imageURL: artist.imageURL,
                    name: artist.name
                ) {
                    onArtistTap(artist)
                }
            }
        }
    }
}
