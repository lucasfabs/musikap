//
//  HomeView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var selectedAlbum: Album?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    if viewModel.isLoading {
                        LoadingView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 100)
                    } else if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundStyle(.red)
                            .padding()
                    } else {
                        // Section Albums
                        AlbumListSection(
                            title: "Albums du moment",
                            albums: viewModel.topAlbums
                        ) { album in
                            selectedAlbum = album
                        }
                        
                        // Section Statistiques
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Statistiques")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            HStack(spacing: 12) {
                                StatCard(
                                    title: "Albums",
                                    value: "\(viewModel.topAlbums.count)",
                                    icon: "square.stack.fill"
                                )
                                
                                StatCard(
                                    title: "Artistes",
                                    value: "\(viewModel.topArtists.count)",
                                    icon: "person.fill"
                                )
                            }
                            .padding(.horizontal)
                        }
                        
                        // Section Artistes
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Artistes populaires")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            ForEach(viewModel.topArtists.prefix(5)) { artist in
                                HStack {
                                    Text(artist.name)
                                        .font(.system(size: 16))
                                    Spacer()
                                    if let listeners = artist.listeners {
                                        Text("\(listeners) écoutes")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Accueil")
            .navigationDestination(item: $selectedAlbum) { album in
                AlbumDetailView(album: album)
            }
            .task {
                await viewModel.loadData()
            }
            .refreshable {
                await viewModel.refreshData()
            }
        }
    }
}

#Preview {
    HomeView()
}
