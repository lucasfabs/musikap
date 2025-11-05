//
//  AlbumInfoSection.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI


struct AlbumInfoSection: View {
    let nbTracks: Int
    let duration: String
    let releaseDate: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                AlbumInfoContainer(icon: "music.note.list", title: "Pistes", value: "\(nbTracks)")
                AlbumInfoContainer(icon: "clock", title: "Durée", value: duration)
            }
            
            HStack(spacing: 16) {
                AlbumInfoContainer(icon: "calendar", title: "Sortie", value: releaseDate)
            }
            
//            label
            HStack(spacing: 4) {
                Text("Label")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
                Spacer()
                Text(label)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

