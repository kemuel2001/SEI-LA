//
//  AppTab.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import Foundation

enum AppTab: String {
    
    case home = "Início"
    case favorites = "Favoritos"
    case watchlist = "Watchlist"
    
    var iconName: String {
        
        switch self {
        case .home:
            return "diamond.fill"
            
        case .favorites:
            return "circle.fill"
            
        case .watchlist:
            return "triangle.fill"
        }
    }
}
