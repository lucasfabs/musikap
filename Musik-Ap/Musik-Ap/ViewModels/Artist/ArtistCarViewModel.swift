//
//  ArtistCarViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
public class ArtistardViewModel {
    public var imageURL: String?
    public var name: String
    public var action: () -> Void
    
    public init(imageURL: String?, name: String, action: @escaping () -> Void) {
        self.imageURL = imageURL
        self.name = name
        self.action = action
    }
}
