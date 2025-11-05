//
//  LastFMServiceProtocol.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

protocol LastFMServiceProtocol {
    func fetchTopAlbums(limit: Int) async throws -> [Album]
    func fetchTopArtists(limit: Int) async throws -> [Artist]
    func fetchTopTracks(limit: Int) async throws -> [Track]
}

// Mock pour les tests
class MockLastFMService: LastFMServiceProtocol {
    func fetchTopAlbums(limit: Int) async throws -> [Album] {
        return [
            Album(name: "Abbey Road", artist: "The Beatles", imageURL: nil, playcount: "1000000", listeners: "500000", mbid: nil),
            Album(name: "Dark Side of the Moon", artist: "Pink Floyd", imageURL: nil, playcount: "900000", listeners: "450000", mbid: nil),
            Album(name: "Thriller", artist: "Michael Jackson", imageURL: nil, playcount: "850000", listeners: "420000", mbid: nil)
        ]
    }
    
    func fetchTopArtists(limit: Int) async throws -> [Artist] {
        return [
            Artist(name: "The Beatles", playcount: "10000000", listeners: "5000000", imageURL: nil, mbid: nil),
            Artist(name: "Pink Floyd", playcount: "9000000", listeners: "4500000", imageURL: nil, mbid: nil)
        ]
    }
    
    func fetchTopTracks(limit: Int) async throws -> [Track] {
        return [
            Track(name: "Bohemian Rhapsody", artist: "Queen", playcount: "5000000", listeners: "2500000"),
            Track(name: "Stairway to Heaven", artist: "Led Zeppelin", playcount: "4800000", listeners: "2400000")
        ]
    }
}
