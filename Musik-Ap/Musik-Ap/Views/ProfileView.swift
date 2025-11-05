//
//  ProfileView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 04/11/2025.
//

//
//  ContentView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 04/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct ProfileView: View {
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Section Info Utilisateur
                    VStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.blue)
                        
                        Text(viewModel.userName)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                    
                    // Section Statistiques
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Mes Statistiques")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        VStack(spacing: 12) {
                            StatCard(
                                title: "Temps d'écoute",
                                value: viewModel.totalListeningTime,
                                icon: "clock.fill"
                            )
                            
                            StatCard(
                                title: "Genre favori",
                                value: viewModel.favoriteGenre,
                                icon: "music.note"
                            )
                            
                            StatCard(
                                title: "Albums favoris",
                                value: "\(viewModel.favoriteAlbums.count)",
                                icon: "heart.fill"
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    // Section Albums Favoris
                    if !viewModel.favoriteAlbums.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Albums Favoris")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            FavoriteAlbumsList(
                                albums: viewModel.favoriteAlbums,
                                onRemove: { album in
                                    viewModel.removeFromFavorites(album: album)
                                }
                            )
                        }
                    } else {
                        VStack(spacing: 12) {
                            Image(systemName: "heart.slash")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(.gray)
                            
                            Text("Aucun album favori pour le moment")
                                .font(.system(size: 16))
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 40)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Profil")
        }
    }
}

#Preview {
    ProfileView()
}
