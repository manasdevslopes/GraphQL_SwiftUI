//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/24/21.
//

import Foundation
import Apollo

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [MovieViewModel] = []
    
    func deleteMovie(movieId: String) {
        
        Network.shared.apollo.perform(mutation: DeleteMovieMutation(movieId: movieId)) { [weak self] result in
            switch result {
                case .success(_):
                    self?.getAllMovies()
                case .failure(let error):
                    print(error) 
            }
        }
        
    }
    
    func getAllMovies(genre: String? = nil) {
    
        Network.shared.apollo.fetch(query: GetAllMoviesQuery(genre: genre), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            
            switch result {
                case .success(let graphQLResult):
                   
                    guard let data = graphQLResult.data,
                          let movies = data.movies
                          else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.movies = movies.compactMap { $0 }.map(MovieViewModel.init)
                    }
                    
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
    
}

struct MovieViewModel {
    
    let movie: GetAllMoviesQuery.Data.Movie
    
    var id: GraphQLID {
        movie.id
    }
    
    var title: String {
        movie.title
    }
    
    var year: String {
        movie.year
    }
    
    var genre: String {
        movie.genre
    }
    
    var poster: String {
        movie.poster
    }
    
}
