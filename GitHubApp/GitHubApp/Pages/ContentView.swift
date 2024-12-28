//
//  ContentView.swift
//  GitHubApp
//
//  Created by Mohammad Azam on 5/14/21.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  @State private var isPresented: Bool = false
  @StateObject private var repositoryListVM = RepositoryListViewModel()
  @State private var cancellable: AnyCancellable?
  
  var body: some View {
    VStack {
      
      Picker("Select", selection: $repositoryListVM.repositoriesDisplay, content: {
        Text("Latest").tag(RepositoryDisplay.latest)
        Text("Top").tag(RepositoryDisplay.top)
      }).pickerStyle(SegmentedPickerStyle())
      
      
      List(repositoryListVM.respositories, id: \.id) { repository in
        HStack {
          VStack(alignment: .leading, spacing: 10) {
            Text(repository.name)
              .font(.headline)
            Text(repository.description)
          }
          Spacer()
          
          if repository.hasRating {
            HStack {
              Text("\(repository.starCount)")
              Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
          }
        }
      }.listStyle(PlainListStyle())
    }
    .padding()
    .onAppear {
      self.cancellable = repositoryListVM.$repositoriesDisplay.sink { display in
        switch display {
          case .latest:
            repositoryListVM.getLatestRepositoriesForUser(userName: Constants.User.username)
          case .top:
            repositoryListVM.getTopRepositoriesForUser(userName: Constants.User.username)
        }
      }
      
    }
    .navigationBarItems(trailing: Button(action: {
      isPresented = true
    }, label: {
      Image(systemName: "plus")
    }))
    .sheet(isPresented: $isPresented, onDismiss: {
      repositoryListVM.getLatestRepositoriesForUser(userName: Constants.User.username)
    }, content: {
      AddRepositoryScreen()
    })
    .navigationTitle("Repositories")
    .embedInNavigationView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
