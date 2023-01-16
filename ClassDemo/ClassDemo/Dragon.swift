//
//  Dragon.swift
//  ClassDemo
//
//  Created by Shadat Tonmoy on 1/16/23.
//

import Foundation

class Dragon : Enemy{
    
    func emitFire(){
        print("Dragon is Emiting fire")
    }
    
    override func move() {
        print("Dragon is moving by flying")
    }
    
    override func attack() {
        print("Dragon is attacking...")
    }
}
