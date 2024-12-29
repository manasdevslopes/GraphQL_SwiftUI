//
//  GenreSelectionView.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/24/21.
//

import SwiftUI

struct GenreSelectionView: View {
    
    let onSelected: (GenreViewModel) -> Void
    
    @State private var selectedGenre: GenreViewModel = GenreViewModel.defaultGenre
    @StateObject private var genreVM = GenreListViewModel()
    var ignoreGenres: [String]?
    
    func prepareGenres() -> [GenreViewModel] {
        
        guard let ignoreGenres = ignoreGenres else {
            return genreVM.genres
        }
        
        return genreVM.genres.filter { genre in
            return !ignoreGenres.contains(genre.name)
        }
        
    }
    
    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(prepareGenres(), id: \.id) { genre in
                Text(genre.name).tag(genre)
            }
        }.pickerStyle(SegmentedPickerStyle())
        .onAppear(perform: {
            genreVM.getAllGenres()
        })
        .onChange(of: selectedGenre, perform: { value in
            onSelected(value)
        })
    }
}

struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView(onSelected: { _ in })
    }
}
