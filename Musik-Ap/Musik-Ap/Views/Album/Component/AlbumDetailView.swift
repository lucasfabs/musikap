//
//  AlbumDetailView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct AlbumDetailView: View {
    @State private var viewModel: AlbumDetailViewModel
    
    init(album: Album) {
        self.viewModel = AlbumDetailViewModel(album: album)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let imageURL = viewModel.album.imageURL,
                   let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                    }
                    .frame(width: 250, height: 250)
                    .cornerRadius(16)
                } else {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .frame(width: 250, height: 250)
                        .cornerRadius(16)
                        .overlay(
                            Image(systemName: "music.note")
                                .font(.system(size: 60))
                                .foregroundStyle(.gray)
                        )
                }
                
                Text(viewModel.album.name)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(viewModel.album.artist)
                    .font(.system(size: 20))
                    .foregroundStyle(.gray)
                
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
}

