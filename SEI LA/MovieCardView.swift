//
//  MovieCardView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import SwiftUI

struct MovieCardView: View {
    
    let movie: Movie
    
    var body: some View {
        
        VStack(spacing: 6) {
            
            if let imageData = movie.imageData,
               let uiImage = UIImage(data: imageData) {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } else {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.25))
                    .frame(height: 150)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
