//
//  RecipeDetailView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-10.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State private var selectedTab: Int = 0
    
    let tabs: [Tab] = [
        .init(icon: Image(systemName: "book.fill"), title: "directions"),
        .init(icon: Image(systemName: "bag.fill"), title: "ingredients")
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                    
                    TabView(selection: $selectedTab) {
                        DirectionsListView()
                            .tag(0)
                        IngredientListView()
                            .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
