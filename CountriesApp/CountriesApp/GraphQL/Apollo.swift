//
//  Apollo.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 27/12/24.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
  
  private init() { }
}
