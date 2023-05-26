//
//  StatisticModel.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/26/23.
//

import Foundation

struct StatisticModel : Identifiable, Hashable{
    let id : String = UUID().uuidString
    let title : String
    let value : String
    let percentageChange : Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
    func increasing() -> Bool {
        return (percentageChange ?? 0.0) > 0
    }
}

let newModel = StatisticModel(title: "", value: "")
