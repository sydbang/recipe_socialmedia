//
//  RecipeModel.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-17.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        
    }
}
