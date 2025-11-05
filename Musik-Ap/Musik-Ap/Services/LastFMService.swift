//
//  LastFMService.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import Foundation

enum LastFMError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class LastFMService: LastFMServiceProtocol {
    private let apiKey: String
    private let baseURL: String
    
    init(apiKey: String = LastFMConstants.apiKey, baseURL: String = LastFMConstants.baseURL) {
        self.apiKey = apiKey
        self.baseURL = baseURL
    }
    
    func fetchTopAlbums(limit: Int = 20) async throws -> [Album] {
        let urlString = "\(baseURL)?method=chart.gettopalbums&api_key=\(apiKey)&format=json&limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        do {
            let chartResponse = try JSONDecoder().decode(ChartAlbumsResponse.self, from: data)
            return chartResponse.albums.album
        } catch {
            print("Decoding error: \(error)")
            throw LastFMError.decodingError
        }
    }
    
    func fetchTopArtists(limit: Int = 20) async throws -> [Artist] {
        let urlString = "\(baseURL)?method=chart.gettopartists&api_key=\(apiKey)&format=json&limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        do {
            let chartResponse = try JSONDecoder().decode(ChartArtistsResponse.self, from: data)
            return chartResponse.artists.artist
        } catch {
            print("Decoding error: \(error)")
            throw LastFMError.decodingError
        }
    }
    
    func fetchTopTracks(limit: Int = 20) async throws -> [Track] {
        let urlString = "\(baseURL)?method=chart.gettoptracks&api_key=\(apiKey)&format=json&limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        do {
            let chartResponse = try JSONDecoder().decode(ChartTracksResponse.self, from: data)
            return chartResponse.tracks.track
        } catch {
            print("Decoding error: \(error)")
            throw LastFMError.decodingError
        }
    }
}
