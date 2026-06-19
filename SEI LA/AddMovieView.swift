//
//  AddMovieView.swift
//  SEI LA
//
//  Created by Kemuel Joao dos Santos Alves on 28/05/26.
//

import SwiftUI
import PhotosUI

struct AddMovieView: View {
    
    @EnvironmentObject var store: MovieStore
    
    @Environment(\.dismiss) private var dismiss
    
    var movieToEdit: Movie? = nil
    
    @State private var title = ""
    
    @State private var review = ""
    
    @State private var rating = 0
    
    @State private var isFavorite = false
    
    @State private var isWatchlist = true
    
    @State private var selectedPhoto: PhotosPickerItem?
    
    @State private var selectedImageData: Data?
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(spacing: 28) {
                        
                        PhotosPicker(
                            selection: $selectedPhoto,
                            matching: .images
                        ) {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.gray.opacity(0.15))
                                    .frame(height: 320)
                                
                                if let selectedImageData,
                                   let uiImage = UIImage(data: selectedImageData) {
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 320)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 24)
                                        )
                                    
                                } else {
                                    
                                    Image(systemName: "plus")
                                        .font(.largeTitle)
                                }
                            }
                        }
                        
                        TextField(
                            "Nome do filme",
                            text: $title
                        )
                        .textFieldStyle(.roundedBorder)
                        
                        
                        HStack(spacing: 12) {
                            
                            ForEach(1...5, id: \.self) { star in
                                
                                Button {
                                    rating = star
                                } label: {
                                    
                                    Image(systemName:
                                            rating >= star
                                          ? "star.fill"
                                          : "star"
                                    )
                                    .font(.title2)
                                }
                            }
                        }
                        
                        Toggle(
                            "Favoritar",
                            isOn: $isFavorite
                        )
                        
                        Toggle(
                            "Adicionar na Watchlist",
                            isOn: $isWatchlist
                        )
                        
                        TextEditor(text: $review)
                            .frame(height: 220)
                            .padding(12)
                            .background(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 18)
                            )
                        
                        
                        Button {
                            
                            let movie = Movie(
                                id: movieToEdit?.id ?? UUID(),
                                title: title,
                                review: review,
                                rating: rating,
                                isFavorite: isFavorite,
                                isWatchlist: isWatchlist,
                                imageData: selectedImageData
                            )
                            
                            if movieToEdit == nil {
                                store.addMovie(movie: movie)
                            } else {
                                store.updateMovie(movie: movie)
                            }
                            
                            dismiss()
                            
                        } label: {
                            
                            Text(
                                movieToEdit == nil
                                ? "Salvar"
                                : "Atualizar"
                            )
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(
                movieToEdit == nil
                ? "Novo Filme"
                : "Editar Filme"
            )
        }
        .task(id: selectedPhoto) {
            
            if let data = try? await selectedPhoto?
                .loadTransferable(type: Data.self) {
                
                selectedImageData = data
            }
        }
        .onAppear {
            
            if let movieToEdit {
                
                title = movieToEdit.title
                
                review = movieToEdit.review
                
                rating = movieToEdit.rating
                
                isFavorite = movieToEdit.isFavorite
                
                isWatchlist = movieToEdit.isWatchlist
                
                selectedImageData = movieToEdit.imageData
            }
        }
    }
}
