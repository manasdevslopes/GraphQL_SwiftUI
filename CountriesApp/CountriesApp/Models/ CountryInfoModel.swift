//
//  CountryInfo.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import Apollo
import SwiftUI

struct CountryInfoModel {
  let countryInfo: GetCountrytInfoQuery.Data.Country?
  
  var name: String {
    countryInfo?.fragments.countryInfo.name ?? ""
  }
  
  var capital: String {
    countryInfo?.fragments.countryInfo.capital ?? ""
  }
  
  var states: [StateViewModel] {
    countryInfo?.states.map { StateViewModel(state: $0) } ?? []
  }
}

struct StateViewModel: Identifiable {
  fileprivate let state: GetCountrytInfoQuery.Data.Country.State
  
  let id: UUID = UUID()
  
  var name: String {
    state.name
  }
}
