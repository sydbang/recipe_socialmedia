//
//  RecipeSNSApp.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-01-10.
//

import SwiftUI
import Firebase


@main
struct RecipeSNSApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
        }
    }
}
