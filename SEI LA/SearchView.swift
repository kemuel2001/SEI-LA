//
//  SearchView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation
import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var store: MovieStore
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var filteredMovies: [Movie] {
        
        if searchText.isEmpty {
            return []
        } else {
            return store.movies.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button("Fechar") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Pesquisar")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("Fechar")
                        .opacity(0)
                }
                .padding()
                
                Spacer()
                
                if searchText.isEmpty {
                    
                    Text("O que você quer assistir hoje?")
                        .foregroundStyle(.gray)
                        .font(.title3)
                    
                } else if filteredMovies.isEmpty {
                    
                    Text("Nenhum filme encontrado")
                        .foregroundStyle(.gray)
                    
                } else {
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 16) {
                            
                            ForEach(filteredMovies) { movie in
                                
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
                
                Spacer()
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                    
                    TextField(
                        "Buscar filmes, atores...",
                        text: $searchText
                    )
                }
                .padding()
                .background(.white)
                .clipShape(Capsule())
                .padding()
            }
        }
    }
}
