//
//  ChartResponse.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

struct DeezerAlbumsResponse: Codable {
    let data: [Album]
}

struct DeezerArtistsResponse: Codable {
    let data: [Artist]
}

struct DeezerTracksResponse: Codable {
    let data: [Track]
}

