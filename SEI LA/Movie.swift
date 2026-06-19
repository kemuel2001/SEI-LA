//
//  Movie.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation

struct Movie: Identifiable, Codable, Equatable {
    
    let id: UUID
    
    var title: String
    
    var review: String
    
    var rating: Int
    
    var isFavorite: Bool
    
    var isWatchlist: Bool
    
    var imageData: Data?
    
    init(
        id: UUID = UUID(),
        title: String,
        review: String,
        rating: Int,
        isFavorite: Bool,
        isWatchlist: Bool,
        imageData: Data?
    ) {
        self.id = id
        self.title = title
        self.review = review
        self.rating = rating
        self.isFavorite = isFavorite
        self.isWatchlist = isWatchlist
        self.imageData = imageData
    }
}
