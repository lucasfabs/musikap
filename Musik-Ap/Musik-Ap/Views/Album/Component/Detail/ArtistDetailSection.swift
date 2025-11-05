//
//  ArtistDetailSection.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct ArtistDetailSection: View {
    let artist: DeezerDetailArtist
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Artiste")
                .font(.system(size: 18, weight: .bold))
            
            HStack(spacing: 12) {
                if let pictureURL = artist.picture_big, let url = URL(string: pictureURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                }
                
                Text(artist.name)
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(8)
        }
    }
}
