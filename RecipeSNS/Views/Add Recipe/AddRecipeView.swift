//
//  AddRecipeView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-06.
//

import SwiftUI

struct AddRecipeView: View {
    
    // Tab selection - to return the user back to tab views
    @Binding var tabSelection: Int
    
    // Properties for recipe meta data
    @State private var name = ""
    @State private var description = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    @State private var source = ""
    @State private var category = ""
    
    // List type recipe meta data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredient data
    @State private var ingredients = [Ingredient]()
    
    // Recipe Image
    @State private var recipeImage: UIImage?
    
    // Image picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeHolderImage = Image("noImageAvailable")
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(tabSelection: Binding.constant(Constants.homeTab))
    }
}
