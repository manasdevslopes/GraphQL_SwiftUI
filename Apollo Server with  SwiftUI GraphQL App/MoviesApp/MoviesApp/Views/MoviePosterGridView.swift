//
//  MoviePosterGridView.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/23/21.
//

import SwiftUI

struct MoviePosterGridView: View {
    
    let posters: [PosterViewModel]
    @Binding var selectedPoster: String
    
    func isSelectedPoster(poster: String) -> Bool {
        return selectedPoster == poster
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
            ForEach(posters, id: \.id) { poster in
                VStack {
                    URLImage(url: poster.poster)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        .onTapGesture {
                            selectedPoster = poster.poster
                        }
                        .shadow(color: .gray, radius: 6, x: 8, y: 8)
                        .shadow(color: .white, radius: 6, x: -8, y: -8)
                        .overlay(
                            
                                ZStack {
                                    
                                    Rectangle()
                                        .fill(Color(#colorLiteral(red: 0.1731345952, green: 0.2430219054, blue: 0.313616395, alpha: 1)))
                                  
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                }
                                .frame(maxHeight: isSelectedPoster(poster: poster.poster) ? 44: 0)
                                .clipShape(.rect(cornerRadii: .init(topLeading: 0, bottomLeading: 16, bottomTrailing: 16, topTrailing: 0), style: .continuous))
                                .animation(.spring(), value: selectedPoster)
                               
                            
                            , alignment: .bottom)
                        
                }
            }
        })
    }
}

struct MoviePosterGridView_Previews: PreviewProvider {
    static var previews: some View {
        
        let movie = Movie(title: "Batman", year: "2002", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdbId: "tt4853102")
        
        return MoviePosterGridView(posters: [PosterViewModel(movie: movie)], selectedPoster: .constant(""))
        
        //return MoviePosterGridView(posters: [PosterViewModel(movie: movie)], onMoviePosterSelected: { _ in })
    }
}
