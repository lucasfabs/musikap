//
//  TrackRow.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct TrackRow: View {
    let track: DetailTrack
    let viewModel: AlbumDetailViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 4) {
                HStack {
                    if let position = track.track_position {
                        Text("\(position)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.gray)
                            .frame(width: 25)
                    }
                    Text(track.title)
                        .font(.system(size: 14, weight: .semibold))
                        .lineLimit(2)
                }
                Spacer()
                Text(viewModel.formatDuration(track.duration))
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8)
    }
}
