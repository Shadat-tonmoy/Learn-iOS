//
//  UserModel.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

struct PostModel : Codable, Identifiable, Hashable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
