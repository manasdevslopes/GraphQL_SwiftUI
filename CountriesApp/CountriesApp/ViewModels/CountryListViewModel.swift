//
//  CountryListViewModel.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import Apollo
import SwiftUI

class CountryListViewModel: ObservableObject {
  @Published var countries: [CountryModel] = []
  
  func getAllCountries() {
    Network.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
      switch result {
        case .success(let graphqlResult):
          print(graphqlResult)
          if let countries = graphqlResult.data?.countries {
            self.countries = countries.map { CountryModel(country: $0) }
          }
        case .failure(let error):
          print("error", error.localizedDescription)
      }
    }
  }
}

