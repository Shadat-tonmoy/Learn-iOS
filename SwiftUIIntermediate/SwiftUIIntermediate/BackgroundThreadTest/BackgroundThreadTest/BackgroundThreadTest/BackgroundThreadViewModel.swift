//
//  BackgroundThreadViewModel.swift
//  BackgroundThreadTest
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI

class BackgroundThreadViewModel : ObservableObject{
    
    @Published var data : [String] = []
    
    
    func fetchData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            
            let newData = self.getData()
            
            DispatchQueue.main.async {
                self.data = newData
            }
        }
    }
    
    
    private func getData() -> [String] {
        var data : [String] = []
        
        for x in 0..<100 {
            data.append("String at : \(x)")
        }
        return data
    }
    
}
