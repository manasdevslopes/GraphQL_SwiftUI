///Users/manasvijaywargiya/Desktop/GraphQL_SwiftUI/CountriesApp/CountriesApp/GraphQL/Queries.graphql
//  CountryViewModel.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import Apollo
import SwiftUI

struct CountryModel: Hashable {
  let country: GetAllCountriesQuery.Data.Country
  
  var code: GraphQLID {
    return country.fragments.countryInfo.code  // Access code directly from the Country object
  }
  
  var name: String {
    return country.fragments.countryInfo.name  // Access name directly from the Country object
  }
  
  var emoji: String {
    return country.fragments.countryInfo.emoji  // Access emoji directly from the Country object
  }
  
  static func == (lhs: CountryModel, rhs: CountryModel) -> Bool {
    lhs.code == rhs.code
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(code)
  }
}

extension CountryModel {
  static var defaultCountry: CountryModel {
    CountryModel(country: GetAllCountriesQuery.Data.Country(name: "India", code: "IN", emoji: "🇮🇳"))
  }
}
