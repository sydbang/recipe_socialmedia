//
//  RecipeTabView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selecteTab = Constants.homeTab
    
    var body: some View {
        TabView (selection: $selecteTab)  {
            RecipeHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
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
            
            RecipeProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
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
