//
//  LastFMService.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

class DeezerService: LastFMServiceProtocol {
    private let baseURL = "https://api.deezer.com"
    
    func fetchTopAlbums(limit: Int = 20) async throws -> [Album] {
        let urlString = "\(baseURL)/chart/0/albums?limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        print("DEBUG URL: \(urlString)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        // Structure de réponse Deezer
        struct DeezerResponse: Codable {
            let data: [DeezerAlbum]
        }
        
        struct DeezerAlbum: Codable {
            let title: String
            let artist: DeezerArtist
            let cover_big: String?
        }
        
        struct DeezerArtist: Codable {
            let name: String
        }
        
        do {
            let response = try JSONDecoder().decode(DeezerResponse.self, from: data)
            return response.data.map { album in
                Album(
                    name: album.title,
                    artist: album.artist.name,
                    imageURL: album.cover_big,
                    playcount: nil,
                    listeners: nil,
                    mbid: nil
                )
            }
        } catch {
            print("Decoding error: \(error)")
            throw LastFMError.decodingError
        }
    }
    
    func fetchTopArtists(limit: Int = 20) async throws -> [Artist] {
        let urlString = "\(baseURL)/chart/0/artists?limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        struct DeezerResponse: Codable {
            let data: [DeezerArtist]
        }
        
        struct DeezerArtist: Codable {
            let name: String
            let picture_big: String?
        }
        
        do {
            let response = try JSONDecoder().decode(DeezerResponse.self, from: data)
            return response.data.map { artist in
                Artist(
                    name: artist.name,
                    playcount: nil,
                    listeners: nil,
                    imageURL: artist.picture_big,
                    mbid: nil
                )
            }
        } catch {
            throw LastFMError.decodingError
        }
    }
    
    func fetchTopTracks(limit: Int = 20) async throws -> [Track] {
        let urlString = "\(baseURL)/chart/0/tracks?limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            throw LastFMError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LastFMError.invalidResponse
        }
        
        struct DeezerResponse: Codable {
            let data: [DeezerTrack]
        }
        
        struct DeezerTrack: Codable {
            let title: String
            let artist: DeezerArtist
        }
        
        struct DeezerArtist: Codable {
            let name: String
        }
        
        do {
            let response = try JSONDecoder().decode(DeezerResponse.self, from: data)
            return response.data.map { track in
                Track(
                    name: track.title,
                    artist: track.artist.name,
                    playcount: nil,
                    listeners: nil
                )
            }
        } catch {
            throw LastFMError.decodingError
        }
    }
}

