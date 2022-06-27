//
//  RecipeHomeView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI

struct RecipeHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Descover New Recipes")
                NavigationLink(
                    destination: RecipeDetailView(r: Recipe()),
                    label: {
                        RecipeCardView(r: Recipe())
                            .padding()
                    }
                )
                Spacer()
            }
        }
    }
}

struct RecipeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHomeView()
    }
}
