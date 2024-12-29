//
//  Constants.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/22/21.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let apiKey = "eb8b131a"
    }
    
    struct Urls {
        
        static func urlByMovieName(name: String) -> URL? {
            return URL(string: "http://www.omdbapi.com/?s=\(name)&page=2&apikey=\(Keys.apiKey)")
        }
    }
}
