//
//  RecipeModel.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-17.
//

import Foundation
import Firebase

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        getData()
        
    }
    
    func addRecipe(authorId: String, name: String, description: String, prepTimeMin: Int, cookTimeMin: Int, totalTimeMin: Int, servings: Int, category: String, source: String) {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to collection
        db.collection("recipes").addDocument(data: ["authorId" : authorId, "name":name, "description": description, "prepTimeMin":prepTimeMin, "cookTimeMin":cookTimeMin, "tota;lTimeMin":totalTimeMin, "servings":servings, "category":category, "source": source]) { error in
            
            // Check for error
            if error == nil {
                // no error
                
                // Call get data to retrieve the latest
                self.getData()
                
            } else {
                // handle the error
                
            }
        }
    }
    
    
    func getData() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("recipes").getDocuments { (querySnapshot, error) in
            // Check for error
            if error == nil {
                // No errors
                if let querySnapshot = querySnapshot {
                    // Get all the documents and create recipes
                    self.recipes = querySnapshot.documents.map { d in
                        // map iterates on all doc and performs this code
                        return Recipe (id: d.documentID,
                                       name: d["name"] as? String ?? "",
                                       description: d["description"] as? String ?? "",
                                       prepTimeMin: d["prepTime"] as? Int ?? 0,
                                       cookTimeMin: d["cookTime"] as? Int ?? 0,
                                       totalTimeMin: d["totalTime"] as? Int ?? 0,
                                       servings: d["servings"] as? Int ?? 0,
                                       category: d["category"] as? String ?? "",
                                       source: d["source"] as? String ?? "",
                                       authorId: d["authorId"] as? String ?? "")
                    }
                }
            } else {
                // Handle the error
                print(error!.localizedDescription)
            }
        }
    }
    
    func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisior(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculate the whole protion
                wholePortion = numerator / denominator
                
                // Calculate the reminder
                numerator %= denominator
                
                portion += String(wholePortion)
            }
            // Express the remainder as a fraction
            if numerator > 0 {
                // Assign remainder as fraction to the portion string
                portion += wholePortion > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            
            // Calculate appropriate suffix
            if wholePortion > 1 && unit.suffix(1) != "s" {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "": " "
            return portion + unit
        }
        return portion
    }
}
