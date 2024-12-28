//
//  RespositoryListViewModel.swift
//  GitHubApp
//
//  Created by Mohammad Azam on 5/16/21.
//

import Foundation
import Apollo

enum RepositoryDisplay {
  case latest, top
}

class RepositoryListViewModel: ObservableObject {
  @Published var repositoriesDisplay: RepositoryDisplay = .latest
  
  @Published var respositories: [RepositoryViewModel] = []
  
  func getLatestRepositoriesForUser(userName: String) {
    Network.shared.apollo.fetch(query: GetRepositoriesByUsernameQuery(username: userName), cachePolicy: .fetchIgnoringCacheData) { result in
      switch result {
        case .success(let graphqlResult):
          guard let data = graphqlResult.data,
                let user = data.user,
                let nodes = user.repositories.nodes else { return }
          DispatchQueue.main.async {
            self.respositories = nodes.compactMap { $0 }.map { RepositoryViewModel(node: $0) }
          }
        case .failure(let error):
          print("error", error.localizedDescription)
      }
    }
  }
   
  func getTopRepositoriesForUser(userName: String) {
    Network.shared.apollo.fetch(query: GetTopRepositoriesByUserQuery(username: userName), cachePolicy: .fetchIgnoringCacheData) { result in
      switch result {
        case .success(let graphqlResult):
          guard let data = graphqlResult.data,
                let user = data.user,
                let nodes = user.repositories.nodes else { return }
          DispatchQueue.main.async {
            self.respositories = nodes.compactMap { $0 }.map { RepositoryViewModel(node: $0) }
          }
        case .failure(let error):
          print("error", error.localizedDescription)
      }
    }
  }
  
}

struct RepositoryViewModel {
  let node: RepositoryNode
  
  var id: GraphQLID { node.id }
  
  var name: String { node.name }
    
  var description: String { node.description ?? ""}
  
  var starCount: Int { node.stargazerCount }
  
  var hasRating: Bool { node.stargazerCount > 0 }
  
}
