//
//  AddMetaData.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-07.
//
import SwiftUI

struct AddMetaData: View {
    
    @Binding var name: String
    @Binding var description: String
    @Binding var cookTime: String
    @Binding var prepTime: String
    @Binding var totalTime: String
    @Binding var servings: String
    @Binding var source: String
    @Binding var category: String
    
    var body: some View {
        Group {
            HStack {
                Text("Name: ")
                    .bold()
                TextField("Tuna Casserole", text: $name)
            }
            
            HStack {
                Text("Description: ")
                    .bold()
                TextField("A delicious meal for the whole family", text: $description)
            }
            
            HStack {
                Text("Prep Time: ")
                    .bold()
                TextField("1 hour", text: $prepTime)
            }
            
            HStack {
                Text("Cook Time: ")
                    .bold()
                TextField("2 hours", text: $cookTime)
            }
            
            HStack {
                Text("Total Time: ")
                    .bold()
                TextField("3 hours", text: $totalTime)
            }
            
            HStack {
                Text("Servings: ")
                    .bold()
                TextField("6", text: $servings)
            }
            
            HStack {
                Text("Source: ")
                    .bold()
                TextField("Youtube: PaekJongWon", text: $source)
            }
            
            HStack {
                Text("Cuisine Category: ")
                    .bold()
                TextField("Korean", text: $category)
            }
            
        }
    }
}

