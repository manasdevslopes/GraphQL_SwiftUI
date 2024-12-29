//
//  GenreListViewModel.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/24/21.
//

import Foundation
import Apollo

class GenreListViewModel: ObservableObject {
    
    @Published var genres: [GenreViewModel] = []
    
    func getAllGenres() {
        
        Network.shared.apollo.fetch(query: GetAllGenresQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data,
                      let genres = data.genres
                else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.genres = genres.compactMap { $0 }.map(GenreViewModel.init)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}

struct GenreViewModel: Identifiable, Hashable {
    
    let id = UUID()
    fileprivate let genre: GetAllGenresQuery.Data.Genre
    
    public static func == (lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
            return lhs.name == rhs.name
    }
    
    var name: String {
        genre.name
    }
    
    static var defaultGenre: GenreViewModel {
        return GenreViewModel(genre: GetAllGenresQuery.Data.Genre(name: "All"))
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

