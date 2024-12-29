//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/21/21.
//

import SwiftUI
import Combine

struct MovieListScreen: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false 
    
    private func genreSelected(vm: GenreViewModel) {
        switch vm.name {
            case "All":
                movieListVM.getAllMovies()
            default:
                movieListVM.getAllMovies(genre: vm.name)
        }
    }
    
    var body: some View {
        VStack {
            
            GenreSelectionView(onSelected: genreSelected)
            
            Spacer()
            
            if !movieListVM.movies.isEmpty {
                MovieListView(movies: movieListVM.movies) { movieId in
                    movieListVM.deleteMovie(movieId: movieId)
                }
            } else {
                NoResultView(message: "No movies found")
            }
            
            Spacer()
            
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            movieListVM.getAllMovies()
        }, content: {
            AddMovieScreen()
        })
        .onAppear(perform: {
            movieListVM.getAllMovies()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarItems(trailing: Button(action: {
            isPresented = true 
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
