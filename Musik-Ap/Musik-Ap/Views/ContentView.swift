//
//  ContentView.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 04/11/2025.
//

import SwiftUI
import MusikapDesignSystem

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                AlbumCard(
                    image: Image(ImageResource.albumTest),
                    title: "Electric Ladyland",
                    subtitle: "Jimi Hendrix"
                ) {
                    print("Carte tapée !")
                }
                AlbumCard(
                    image: Image(ImageResource.albumTest),
                    title: "Electric Ladyland",
                    subtitle: "Jimi Hendrix"
                ) {
                    print("Carte tapée !")
                }
                AlbumCard(
                    image: Image(ImageResource.albumTest),
                    title: "Electric Ladyland",
                    subtitle: "Jimi Hendrix"
                ) {
                    print("Carte tapée !")
                }
                AlbumCard(
                    image: Image(ImageResource.albumTest),
                    title: "Electric Ladyland",
                    subtitle: "Jimi Hendrix"
                ) {
                    print("Carte tapée !")
                }
                AlbumCard(
                    image: Image(ImageResource.albumTest),
                    title: "Electric Ladyland",
                    subtitle: "Jimi Hendrix"
                ) {
                    print("Carte tapée !")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
