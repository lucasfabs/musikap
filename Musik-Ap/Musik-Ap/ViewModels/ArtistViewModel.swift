//
//  ProfileViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class ArtistViewModel {
    var topArtists: [Artist] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let service: DeezerServiceProtocol
    
    init(service: DeezerServiceProtocol = DeezerService()) {
        self.service = service
    }
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let artists = service.fetchTopArtists(limit: 25)
            
            let (fetchedArtists) = try await ( artists)
            
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
