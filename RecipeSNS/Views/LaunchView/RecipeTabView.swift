//
//  RecipeTabView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.homeTab
    
    var body: some View {
        TabView (selection: $selectedTab)  {
            RecipeHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("New Recipes")
                    }
                }
                .tag(Constants.homeTab)
            
            RecipeSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(Constants.searchTab)
            
            RecipeSavedView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Saved")
                    }
                }
                .tag(Constants.savedTab)
            
            RecipeProfileView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("My Recipes")
                    }
                }
                .tag(Constants.profileTab)
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
