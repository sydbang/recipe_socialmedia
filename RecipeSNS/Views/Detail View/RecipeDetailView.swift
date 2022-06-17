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
        .init(icon: Image(systemName: "bag.fill"), title: "ingredients"),
        .init(icon: Image(systemName: "book.fill"), title: "directions")
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack (alignment: .leading){
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                    
                    TabView(selection: $selectedTab) {
                        
                        IngredientListView()
                            .tag(0)
                        DirectionsListView()
                            .tag(1)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
