//
//  HomeView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: MovieStore
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            ScrollView {
                
                if store.movies.isEmpty {
                    
                    EmptyStateView()
                    
                } else {
                    
                    LazyVGrid(
                        columns: columns,
                        spacing: 16
                    ) {
                        
                        ForEach(store.movies) { movie in
                            
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
        }
        .navigationTitle("Owncine")
    }
}
