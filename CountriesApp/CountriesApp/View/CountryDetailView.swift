//
//  CountryDetailView.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import SwiftUI

struct CountryDetailView: View {
  let country: CountryModel
  @StateObject private var countryDetailVM = CountryDetailViewModel()
  
    var body: some View {
      VStack {
        Text(countryDetailVM.countryInfo.name)
        Text(countryDetailVM.countryInfo.capital)
        List(countryDetailVM.countryInfo.states, id: \.id) { state in
          Text(state.name)
        }.listStyle(.plain)
      }
      .onAppear {
        countryDetailVM.getCountryDetailsByCode(code: country.code)
      }
    }
}

#Preview {
  CountryDetailView(country: CountryModel.defaultCountry)
}
