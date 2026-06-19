//
//  SEI_LAApp.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 18/05/26.
//

import SwiftUI


@main
struct OwncineApp: App {
    
    @StateObject var store = MovieStore()
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
                .environmentObject(store)
        }
    }
}
