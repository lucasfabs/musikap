//
//  HomeViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var topAlbums: [Album] = []
    var topArtists: [Artist] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let service: LastFMServiceProtocol
    
    init(service: LastFMServiceProtocol = LastFMService()) {
        self.service = service
    }
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let albums = service.fetchTopAlbums(limit: 10)
            async let artists = service.fetchTopArtists(limit: 10)
            
            let (fetchedAlbums, fetchedArtists) = try await (albums, artists)
            
            topAlbums = fetchedAlbums
            topArtists = fetchedArtists
        } catch {
            errorMessage = "Erreur lors du chargement: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func refreshData() async {
        await loadData()
    }
}
