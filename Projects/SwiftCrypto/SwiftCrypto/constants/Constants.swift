//
//  Constants.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/9/23.
//

import Foundation


class NavigationPaths : ObservableObject {
    
    @Published var paths : [Int] = []
    
    func addCoinDetailsScreen(index : Int) {
        paths.append(index)
    }
    
    func clear() {
        paths = []
    }
}
