//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 5/21/21.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
