//
//  HomeView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct AlbumsView: View {
    @State private var viewModel = AlbumViewModel()
    @State private var selectedAlbum: Album?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 100)
                } else {
                    VStack(alignment: .leading, spacing: 24) {
                        AlbumListSection(
                            title: "Albums du moment",
                            albums: viewModel.topAlbums
                        ) { album in
                            selectedAlbum = album
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Albums")
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
    AlbumsView()
}

