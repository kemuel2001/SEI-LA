//
//  MainTabview.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//
import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: AppTab = .home
    
    @State private var isSearchPresented = false
    
    @State private var isAddPresented = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            TabView(selection: $selectedTab) {
                
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Início", systemImage: "diamond.fill")
                }
                .tag(AppTab.home)
                
                
                NavigationStack {
                    FavoritesView()
                }
                .tabItem {
                    Label("Favoritos", systemImage: "circle.fill")
                }
                .tag(AppTab.favorites)
                
                
                NavigationStack {
                    WatchlistView()
                }
                .tabItem {
                    Label("Watchlist", systemImage: "triangle.fill")
                }
                .tag(AppTab.watchlist)
            }
            .tint(.blue)
            
            
            VStack(spacing: 14) {
                
                Button {
                    isAddPresented = true
                } label: {
                    
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: 58, height: 58)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                
                
                Button {
                    isSearchPresented = true
                } label: {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .frame(width: 62, height: 62)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            .shadow(radius: 10)
            .padding(.trailing, 24)
            .padding(.bottom, 20)
        }
        .sheet(isPresented: $isSearchPresented) {
            
            NavigationStack {
                SearchView()
            }
        }
        .sheet(isPresented: $isAddPresented) {
            
            NavigationStack {
                AddMovieView()
            }
        }
    }
}
