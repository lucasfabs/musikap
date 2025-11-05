//
//  ArtistDetailViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class ArtistDetailViewModel {
    let artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
}
