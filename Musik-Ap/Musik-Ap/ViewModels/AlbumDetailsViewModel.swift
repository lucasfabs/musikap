//
//  AlbumDetailsViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
class AlbumDetailViewModel {
    let album: Album
    
    init(album: Album) {
        self.album = album
    }
    
}
