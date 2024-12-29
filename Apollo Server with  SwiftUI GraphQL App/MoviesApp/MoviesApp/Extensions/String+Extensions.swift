//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/22/21.
//

import Foundation

extension String {
    
    func encoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self 
    }
    
}
