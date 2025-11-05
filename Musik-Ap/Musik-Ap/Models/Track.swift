//
//  Track.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

struct Track: Identifiable, Codable {
    let id = UUID()
    let name: String
    let artist: String
    let playcount: String?
    let listeners: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case artist
        case playcount
        case listeners
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        if let artistDict = try? container.decode([String: String].self, forKey: .artist) {
            artist = artistDict["name"] ?? "Unknown Artist"
        } else {
            artist = try container.decode(String.self, forKey: .artist)
        }
        
        playcount = try? container.decode(String.self, forKey: .playcount)
        listeners = try? container.decode(String.self, forKey: .listeners)
    }
    
    init(name: String, artist: String, playcount: String?, listeners: String?) {
        self.name = name
        self.artist = artist
        self.playcount = playcount
        self.listeners = listeners
    }
}
