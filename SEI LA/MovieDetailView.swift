//
//  MovieDetailView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var store: MovieStore
    
    @Environment(\.dismiss) private var dismiss
    
    let movie: Movie
    
    @State private var isEditing = false
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    MovieCardView(movie: movie)
                        .frame(height: 260)
                    
                    Text(movie.title)
                        .font(.title)
                        .bold()
                    
                    Text(movie.review)
                        .padding(.horizontal)
                    
                    HStack {
                        
                        ForEach(1...5, id: \.self) { star in
                            
                            Image(systemName:
                                    movie.rating >= star
                                  ? "star.fill"
                                  : "star"
                            )
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                
                Button("Editar") {
                    isEditing = true
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                
                Button(role: .destructive) {
                    
                    store.deleteMovie(movie: movie)
                    
                    dismiss()
                    
                } label: {
                    
                    Image(systemName: "trash")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            AddMovieView(movieToEdit: movie)
        }
    }
}
