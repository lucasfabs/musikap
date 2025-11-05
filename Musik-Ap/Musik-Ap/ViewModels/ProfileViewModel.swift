//
//  ProfileViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class ProfileViewModel {
    var favoriteAlbums: [Album] = []
    var userName: String = "Utilisateur"
    var totalListeningTime: String = "1,234 heures"
    var favoriteGenre: String = "Rock"
    
    func addToFavorites(album: Album) {
        if !favoriteAlbums.contains(where: { $0.name == album.name && $0.artist == album.artist }) {
            favoriteAlbums.append(album)
        }
    }
    
    func removeFromFavorites(album: Album) {
        favoriteAlbums.removeAll { $0.id == album.id }
    }
    
    func isFavorite(album: Album) -> Bool {
        favoriteAlbums.contains { $0.name == album.name && $0.artist == album.artist }
    }
}
