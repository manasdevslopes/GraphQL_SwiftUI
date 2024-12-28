//
//  GitHubAppApp.swift
//  GitHubApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//
// GitHub GraphQL API Queries Playground - http://docs.github.com/en/graphql/overview/explorer
//

import SwiftUI

@main
struct GitHubAppApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

/*
query LoginQuery{
  viewer {
    login
  }
}

query RepositoryOwner {
  repositoryOwner(login: "manasdevslopes") {
    avatarUrl
    repositories(last: 10) {
      nodes {
        name
        description
        stargazerCount
        url
      }
    }
  }
}

mutation CreateRepo {
  createRepository(input: {
    name: "Testing_Repo"
    visibility: PUBLIC
    clientMutationId: "1001001"
  }) {
    clientMutationId
    repository {
      createdAt
      isPrivate
      name
      url
      visibility
    }
  }
}
*/
