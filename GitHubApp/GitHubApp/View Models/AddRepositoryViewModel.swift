//
//  AddRepositoryViewModel.swift
//  GitHubApp
//
//  Created by Mohammad Azam on 5/16/21.
//

import Foundation

class AddRepositoryViewModel: ObservableObject {
  var name: String = ""
  var description: String = ""
  var visibility: RepositoryVisibility = .public
  @Published var errors: [ErrorViewModel] = []
  
  func saveRepository(completion: @escaping () -> Void) {
    Network.shared.apollo.perform(mutation: CreateRepositoryMutation(name: name, description: description, visibility: visibility, clientMutationId: UUID().uuidString)) { result in
      switch result {
        case .success(let graphqlResult):
          if let errors = graphqlResult.errors {
            DispatchQueue.main.async {
              self.errors = errors.map { ErrorViewModel(message: $0.message) }
            }
          } else {
            DispatchQueue.main.async {
              completion()
            }
          }
        case .failure(let error):
          DispatchQueue.main.async {
            self.errors = [ErrorViewModel(message: error.localizedDescription)]
          }
      }
    }
  }
}
