//
//  AddMovieScreen.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/22/21.
//

import SwiftUI

struct AddMovieScreen: View {
    
    @StateObject private var addMovieVM = AddMovieViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Form {
            
            TextField("Name", text: $addMovieVM.name, onEditingChanged: { _ in }) {
                addMovieVM.fetchPostersByMovieName(name: addMovieVM.name.encoded())
            }
            
            TextField("Year", text: $addMovieVM.year)
            
            GenreSelectionView(onSelected: { (vm) in
                addMovieVM.genre = vm.name
            }, ignoreGenres: ["All"])
            
            MoviePosterGridView(posters: addMovieVM.posters, selectedPoster: $addMovieVM.poster)
            
        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(trailing: Button("Save") {
            addMovieVM.addMovie {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
