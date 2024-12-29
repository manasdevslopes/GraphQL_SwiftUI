//
//  AddMovieViewModel.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/26/21.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    
    @Published var posters: [PosterViewModel] = []
    
    var name: String = ""
    var year: String = ""
    @Published var poster: String = ""
    var genre: String = ""
    
    func addMovie(completion: @escaping () -> Void) {
        
        let movie = MovieInput(title: name, year: year, genre: genre, poster: poster)
        
        Network.shared.apollo.perform(mutation: CreateMovieMutation(movie: movie)) { result in
            switch result {
                case .success(_):
                    completion()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func fetchPostersByMovieName(name: String) {
        Webservice().getMovieByName(name: name) { [weak self] (result) in
            switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self?.posters = movies.map(PosterViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}

struct PosterViewModel {
    
    let movie: Movie
    
    let id = UUID()
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
}
