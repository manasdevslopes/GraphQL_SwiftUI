//
//  RepositoryNode.swift
//  GitHubApp
//
//  Created by MANAS VIJAYWARGIYA on 28/12/24.
//

import Apollo

protocol RepositoryNode {
  var id: GraphQLID { get }
  var name: String { get }
  var description: String? { get }
  var stargazerCount: Int { get }
}
