//
//  AlbumViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class AlbumViewModel {
    var topAlbums: [Album] = []
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
            async let albums = service.fetchTopAlbums(limit: 25)
            
            let (fetchedAlbums) = try await (albums)
            
            topAlbums = fetchedAlbums

        } catch {
            errorMessage = "Erreur de chargement: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func refreshData() async {
        await loadData()
    }
}
