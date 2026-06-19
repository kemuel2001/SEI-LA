//
//  WatchlistView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//


import SwiftUI

struct WatchlistView: View {
    
    @EnvironmentObject var store: MovieStore
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var watchlistMovies: [Movie] {
        store.movies.filter { $0.isWatchlist }
    }
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(watchlistMovies) { movie in
                        
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
        .navigationTitle("Watchlist")
    }
}
