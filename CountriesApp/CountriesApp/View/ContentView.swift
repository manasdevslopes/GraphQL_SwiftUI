//
//  ContentView.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 27/12/24.
//

import SwiftUI
import Apollo

struct ContentView: View {
  @StateObject private var countryListVM = CountryListViewModel()
  
    var body: some View {
      NavigationStack {
        VStack {
          List(countryListVM.countries, id: \.code) { country in
            NavigationLink(value: country) {
              HStack {
                Text(country.name)
                  .font(.headline)
                Text(country.emoji)
              }
            }
          }.listStyle(.plain)
        }
        .navigationTitle("Countries")
        .onAppear {
          countryListVM.getAllCountries()
        }
        .navigationDestination(for: CountryModel.self) { country in
          CountryDetailView(country: country)
        }
      }
    }
}

#Preview {
    ContentView()
}
