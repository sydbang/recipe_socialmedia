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
        
        
    }
    
    func getData() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("receipes").getDocuments { (querySnapshot, error) in
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
            }
        }
    }
}
