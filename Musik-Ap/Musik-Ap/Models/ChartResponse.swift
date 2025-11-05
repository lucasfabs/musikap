//
//  ChartResponse.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

struct ChartAlbumsResponse: Codable {
    let albums: AlbumsContainer
    
    struct AlbumsContainer: Codable {
        let album: [Album]
    }
}

struct ChartArtistsResponse: Codable {
    let artists: ArtistsContainer
    
    struct ArtistsContainer: Codable {
        let artist: [Artist]
    }
}

struct ChartTracksResponse: Codable {
    let tracks: TracksContainer
    
    struct TracksContainer: Codable {
        let track: [Track]
    }
}
