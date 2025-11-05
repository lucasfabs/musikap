//
//  Albums.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

struct Album: Identifiable, Codable {
    let id = UUID()
    let name: String
    let artist: String
    let imageURL: String?
    let playcount: String?
    let listeners: String?
    let mbid: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case artist
        case imageURL = "image"
        case playcount
        case listeners
        case mbid
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        if let artistDict = try? container.decode([String: String].self, forKey: .artist) {
            artist = artistDict["name"] ?? "Unknown Artist"
        } else {
            artist = try container.decode(String.self, forKey: .artist)
        }
        
        if let images = try? container.decode([[String: String]].self, forKey: .imageURL),
           let largeImage = images.first(where: { $0["size"] == "large" || $0["size"] == "extralarge" }) {
            imageURL = largeImage["#text"]
        } else {
            imageURL = nil
        }
        
        playcount = try? container.decode(String.self, forKey: .playcount)
        listeners = try? container.decode(String.self, forKey: .listeners)
        mbid = try? container.decode(String.self, forKey: .mbid)
    }
    
    init(name: String, artist: String, imageURL: String?, playcount: String?, listeners: String?, mbid: String?) {
        self.name = name
        self.artist = artist
        self.imageURL = imageURL
        self.playcount = playcount
        self.listeners = listeners
        self.mbid = mbid
    }
}
