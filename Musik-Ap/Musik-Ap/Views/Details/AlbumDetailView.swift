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
                
                if let playcount = viewModel.album.playcount {
                    HStack(spacing: 30) {
                        VStack {
                            Text(playcount)
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                            Text("Écoutes")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        
                        if let listeners = viewModel.album.listeners {
                            VStack {
                                Text(listeners)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                Text("Auditeurs")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.top)
                }
                
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    HStack {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        Text(viewModel.isFavorite ? "Retirer des favoris" : "Ajouter aux favoris")
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isFavorite ? Color.red : Color.blue)
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
}
