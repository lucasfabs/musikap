//
//  LoadingView.swift
//  MusikapDesignSystem
//
//  Created by FABIOLE Lucas on 05/11/2025.
//

import SwiftUI

public struct LoadingView: View {
    public init() {}
    
    public var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)
            
            Text("Chargement...")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
        }
    }
}
