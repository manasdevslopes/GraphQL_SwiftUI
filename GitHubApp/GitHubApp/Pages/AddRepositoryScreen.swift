//
//  AddRepositoryScreen.swift
//  GitHubApp
//
//  Created by Mohammad Azam on 5/16/21.
//

import SwiftUI


struct AddRepositoryScreen: View {
  
  @Environment(\.dismiss) private var dismiss
  @StateObject private var addRepositoryVM = AddRepositoryViewModel()
  
  var body: some View {
    Form {
      TextField("Name", text: $addRepositoryVM.name)
      TextField("Description", text: $addRepositoryVM.description)
      
      Picker("Select", selection: $addRepositoryVM.visibility, content: {
        Text("Public").tag(RepositoryVisibility.public)
        Text("Private").tag(RepositoryVisibility.private)
      }).pickerStyle(SegmentedPickerStyle())
      
      HStack {
        Spacer()
        Button("Save") {
          addRepositoryVM.saveRepository {
            dismiss()
          }
        }
        Spacer()
      }
    }
    .navigationTitle("Add Repository")
    .embedInNavigationView()
  }
}

struct AddRepositoryScreen_Previews: PreviewProvider {
  static var previews: some View {
    AddRepositoryScreen()
  }
}
