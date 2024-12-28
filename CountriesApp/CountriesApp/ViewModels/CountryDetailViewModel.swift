//
//  CountryDetailViewModel.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import Apollo
import SwiftUI

class CountryDetailViewModel: ObservableObject {
  @Published var countryInfo: CountryInfoModel = .init(countryInfo: nil)
  
  func getCountryDetailsByCode(code: GraphQLID) {
    Network.shared.apollo.fetch(query: GetCountrytInfoQuery(code: code)) { result in
      switch result {
        case .success(let graphqlResult):
          print(graphqlResult)
          if let country = graphqlResult.data?.country {
            self.countryInfo = CountryInfoModel(countryInfo: country)
          }
        case .failure(let error):
          print("error", error.localizedDescription)
      }
    }
  }
}
