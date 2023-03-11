//
//  MovieDatabase.swift
//  MovieList
//
//  Created by Md Zahidul Islam Mazumder on 11/3/23.
//

import Foundation

struct MovieDataBase : Codable {
    let results : [Results]?
}


struct Results : Codable,Identifiable {
    let id : Int?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let poster_path : String?
}
