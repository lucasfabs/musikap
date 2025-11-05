//
//  AlbumCardViewModel.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation
import Observation

@Observable
public class AlbumCardViewModel {
    public var title: String
    public var subtitle: String
    public var imageURL: String?
    
    public init(title: String, subtitle: String, imageURL: String?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}
