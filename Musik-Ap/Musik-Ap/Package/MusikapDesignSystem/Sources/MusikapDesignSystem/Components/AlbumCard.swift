//
//  AlbumCard.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 04/11/2025.
//

import SwiftUI

public struct AlbumCard: View {
    let imageURL: String?
    let title: String
    let subtitle: String
    let action: () -> Void

    public init(imageURL: String?, title: String, subtitle: String, action: @escaping () -> Void) {
        self.imageURL = imageURL
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }

    public var body: some View {
        HStack {
            if let urlString = imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .overlay(
                            ProgressView()
                        )
                }
                .frame(width: 100, height: 100)
                .cornerRadius(24)
            } else {
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .cornerRadius(24)
                    .overlay(
                        Image(systemName: "music.note")
                            .font(.system(size: 30))
                            .foregroundStyle(.gray)
                    )
            }
            
            VStack(alignment: .leading) {
                CardTitlePrimary(label: title) {
                    action()
                }
                CardTitleSecondary(label: subtitle) {
                    action()
                }
            }
        }
        .padding(.bottom)
    }
}
