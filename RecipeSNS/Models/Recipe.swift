//
//  Recipe.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-17.
//

import Foundation

struct Recipe: Identifiable {
    
    var id:String?
    
    var name:String?
    var description: String?
    var prepTimeMin: Int?
    var cookTimeMin: Int?
    var totalTimeMin: Int?
    var servings: Int?
    var ingredients: [Ingredient]?
    var directions: [String]?
    var category:String?
    var source: String?
    var authorId: String?
    
}
