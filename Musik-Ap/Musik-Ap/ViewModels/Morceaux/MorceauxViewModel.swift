//
//  MorceauxViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 06/11/2025.
//

import Foundation
import Observation

@Observable
class MorceauxViewModel {
    var topTracks: [Track] = []
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
            topTracks = try await service.fetchTopTracks(limit: 25)
        } catch {
            errorMessage = "Erreur lors du chargement : \(error.localizedDescription)"
        }
        isLoading = false
    }
}
