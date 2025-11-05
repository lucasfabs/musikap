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

struct ArtistView: View {
    @State private var viewModel = ArtistViewModel()
    @State private var selectedArtist: Artist?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 100)
                } else {
                    VStack(alignment: .leading, spacing: 24) {
                        TopArtistSection(
                            artists: viewModel.topArtists,
                            title: "Artistes du moment"
                        ){ artist in
                            selectedArtist = artist
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Artistes")
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
    ArtistView()
}
