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
            HStack {
              Text(country.name)
                .font(.headline)
              Text(country.emoji)
            }
          }
        }
        .navigationTitle("Countries")
        .onAppear {
          countryListVM.getAllCountries()
        }
      }
    }
}

#Preview {
    ContentView()
}


struct CountryViewModel {
  fileprivate let country: GetAllCountriesQuery.Data.Country
  
  var code: GraphQLID {
    return country.fragments.countryInfo.code  // Access code directly from the Country object
  }
  
  var name: String {
    return country.fragments.countryInfo.name  // Access name directly from the Country object
  }
  
  var emoji: String {
    return country.fragments.countryInfo.emoji  // Access emoji directly from the Country object
  }
}

class CountryListViewModel: ObservableObject {
  @Published var countries: [CountryViewModel] = []
  
  func getAllCountries() {
    Network.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
      switch result {
        case .success(let graphqlResult):
          print(graphqlResult)
          if let countries = graphqlResult.data?.countries {
            self.countries = countries.map { CountryViewModel(country: $0) }
          }
        case .failure(let error):
          print("error", error.localizedDescription)
      }
    }
  }
}
