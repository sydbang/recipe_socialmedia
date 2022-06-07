//
//  AddIngredientView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-07.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Binding var ingredients: [Ingredient]
    
    @State private var name = ""
    @State private var unit = ""
    @State private var num = ""
    @State private var denum = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Ingredients: ")
                .bold()
                .padding(.top, 5)
        }
    }
}

