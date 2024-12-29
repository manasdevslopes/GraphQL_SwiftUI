//
//  Apollo.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/21/21.
//

import Foundation
import Apollo

class Network {
    
    static let shared: Network = Network()
    
    private init() { }
    
    lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8080")!)
    
}
