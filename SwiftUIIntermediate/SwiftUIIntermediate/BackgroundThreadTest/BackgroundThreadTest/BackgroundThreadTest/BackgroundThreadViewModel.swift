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
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) { [weak self] in
            
            if let newData = self?.getData() {
                DispatchQueue.main.async {
                    self?.data = newData
                }
            }
        }
    }
    
    func fetchData2(){
        getData2(completionHandler: { result in
            self.data = result
            
        })
    }
    
    
    func getData2(completionHandler : @escaping (_ result : [String]) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3){
            var data : [String] = []
            
            for x in 0..<100 {
                data.append("String at : \(x)")
            }
            
            DispatchQueue.main.async {
                completionHandler(data)
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
