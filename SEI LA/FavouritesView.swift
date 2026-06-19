//
//  FavouritesView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var store: MovieStore
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var favoriteMovies: [Movie] {
        store.movies.filter { $0.isFavorite }
    }
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(favoriteMovies) { movie in
                        
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCardView(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Favoritos")
    }
}
