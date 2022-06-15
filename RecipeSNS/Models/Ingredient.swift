//
//  Ingredient.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-17.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name: String = ""
    var num: Int?
    var denom: Int?
    var unit: String?
}
