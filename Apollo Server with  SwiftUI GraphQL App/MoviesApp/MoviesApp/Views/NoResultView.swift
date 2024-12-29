//
//  NoResultView.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/21/21.
//

import SwiftUI

struct NoResultView: View {
    
    let message: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.yellow)
            Text(message)
        }
        .padding()
        
    }
}

struct NoResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView(message: "No movies found")
    }
}
