//
//  CountriesAppApp.swift
//  CountriesApp
//
//  Created by MANAS VIJAYWARGIYA on 27/12/24.
//
// Get Started with Apollo Docs - https://www.apollographql.com/docs/ios/get-started
// GraphQL queries use this website or the app installed in the Mac - https://graphql-demo.mead.io

/*
 Steps for GraphQL Apps
 
 1. First Install node npm.
 2. Second Install Apollo - npm install -g apollo
 3. Install apollo-ios SPM package with version 0.50.0 Up to Next Major. - https://github.com/apollographql/apollo-ios.git & Select Apollo only
 4. Schema -
  a. Download Schema by using the GraphQL App installed in Mac or by using Apollo CLI.
  b. For Apollo CLI - In Terminal, Go to Root of the project -> type - apollo schema:download --endpoint=https://countries.trevorblades.com/
  c. Schema.json file will be downloaded then add that file inside GraphQL Folder.
 5. Create a file inside GraphQL folder named as - "Queries.graphql"
 6. Then create a new file in the GraphQL folder named as "Apollo". Add codes for Apollo Client URL singleton class for GraphQL queries - https://countries.trevorblades.com/
 7. To create API.swift file inside GraphQL folder follow below steps -
  a. cd Desktop -> cd GraphQl_SwiftUI -> cd CountriesApp -> cd CountriesApp again
  b. Run this command in terminal - apollo codegen:generate --target=swift --includes=./GraphQL/Queries.graphql --localSchemaFile="./GraphQL/schema.json" ./GraphQL/API.swift
 */

import SwiftUI

@main
struct CountriesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
