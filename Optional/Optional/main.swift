//
//  main.swift
//  Optional
//
//  Created by Shadat Tonmoy on 1/17/23.
//

import Foundation

let optionalString : String?

optionalString = nil

if optionalString != nil {
    let text : String = optionalString!
} else {
    print("Skipped")
}

if let safeOption = optionalString {
    print("Safe option value : \(safeOption)")
} else {
    print("Skip")
}


