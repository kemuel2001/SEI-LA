//
//  MovieStore.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation
import Combine

class MovieStore: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    func addMovie(movie: Movie) {
        movies.append(movie)
    }
    
    func deleteMovie(movie: Movie) {
        movies.removeAll { $0.id == movie.id }
    }
    
    func updateMovie(movie: Movie) {
        
        if let index = movies.firstIndex(where: {
            $0.id == movie.id
        }) {
            movies[index] = movie
        }
    }
}
