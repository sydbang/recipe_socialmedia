//
//  RecipeSearchView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI

struct RecipeSearchView: View {
    
    @State private var filterBy = ""
    
    var body: some View {
        VStack {
            SearchBarView(filterBy: $filterBy)
                .padding()
            Spacer()
        }
    }
}

struct RecipeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearchView()
    }
}
