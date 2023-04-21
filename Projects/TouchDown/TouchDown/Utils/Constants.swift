//
//  Constants.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

// DATA
let playerList : [Player] = Bundle.main.decode(fileName: "player.json")
let categoryList : [Category] = Bundle.main.decode(fileName: "category.json")
let productList : [Product] = Bundle.main.decode(fileName: "product.json")
let brandList : [Brand] = Bundle.main.decode(fileName: "brand.json")

// COLOR
let colorBackground : Color = Color("ColorBackground")
let colorGray : Color = Color(UIColor.systemGray4)


// LAYOUT
let columnSpacing : CGFloat = 10
let rowSpacing : CGFloat = 10
var gridLayoutItems : [GridItem] = Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
var productGridLayoutItem : [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)

// API

// IMAGE
