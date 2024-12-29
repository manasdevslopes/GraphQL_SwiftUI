//
//  FartCounter.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/21/21.
//

import SwiftUI

struct FartCounter: View {
    
    @State private var fartCount: Int = 0
    
    var body: some View {
        VStack {
            Text("💨")
                .font(.system(size: 100))
            Text("\(fartCount)")
                .font(.largeTitle)
            Button("Fart") {
                fartCount += 1 
            }.padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        }
    }
}

struct FartCounter_Previews: PreviewProvider {
    static var previews: some View {
        FartCounter()
    }
}
