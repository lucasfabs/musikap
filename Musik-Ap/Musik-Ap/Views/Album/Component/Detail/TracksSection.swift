//
//  TracksSection.swift
//  Musik-Ap
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

struct TracksSection: View {
    let tracks: [DetailTrack]
    let viewModel: AlbumDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pistes")
                .font(.system(size: 18, weight: .bold))
            
            ForEach(tracks) { track in
                TrackRow(track: track, viewModel: viewModel)
            }
        }
    }
}
