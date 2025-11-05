//
//  Artist.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

struct Artist: Identifiable, Codable {
    let id = UUID()
    let name: String
    let playcount: String?
    let listeners: String?
    let imageURL: String?
    let mbid: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case playcount
        case listeners
        case imageURL = "image"
        case mbid
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        playcount = try? container.decode(String.self, forKey: .playcount)
        listeners = try? container.decode(String.self, forKey: .listeners)
        mbid = try? container.decode(String.self, forKey: .mbid)
        
        if let images = try? container.decode([[String: String]].self, forKey: .imageURL),
           let largeImage = images.first(where: { $0["size"] == "large" }) {
            imageURL = largeImage["#text"]
        } else {
            imageURL = nil
        }
    }
    
    init(name: String, playcount: String?, listeners: String?, imageURL: String?, mbid: String?) {
        self.name = name
        self.playcount = playcount
        self.listeners = listeners
        self.imageURL = imageURL
        self.mbid = mbid
    }
}
