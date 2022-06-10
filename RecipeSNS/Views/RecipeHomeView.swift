//
//  RecipeHomeView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI

struct RecipeHomeView: View {
    var body: some View {
        VStack {
            Text("Descover New Recipes")
            RecipeCardView()
                .padding()
        }
    }
}

struct RecipeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHomeView()
    }
}
