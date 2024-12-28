//
//  Query+Extensions.swift
//  GitHubApp
//
//  Created by Mohammad Azam on 5/17/21.
//

import Foundation
import Apollo

extension GetRepositoriesByUsernameQuery.Data.User.Repository.Node: RepositoryNode { }
extension GetTopRepositoriesByUserQuery.Data.User.Repository.Node: RepositoryNode { }
