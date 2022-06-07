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
        VStack {
            HStack {
                Button("Clear") {
                    clear()
                }
                Spacer()
                Button("Add") {
                    addRecipe()
                    clear()
                    tabSelection = Constants.profileTab
                }
            }
            
            // Scroll view
            ScrollView {
                VStack {
                    
                    // Recipe Image
                    placeHolderImage
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Spacer()
                        Button("Photo Library") {
                            isShowingImagePicker = true
                            selectedImageSource = .photoLibrary
                        }
                        Spacer()
                        Text(" | ")
                        Spacer()
                        Button("Camera") {
                            isShowingImagePicker = true
                            selectedImageSource = .camera
                        }
                        Spacer()
                    }
                    // need to create sheet for imagepicker
                    
                    // The recipe meta data
                    AddMetaData(name: $name,
                                description: $description,
                                cookTime: $cookTime,
                                prepTime: $prepTime,
                                totalTime: $totalTime,
                                servings: $servings, source: $source, category: $category)
                    // List data
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add the oil to the pan")
                }
            }
        }
    }
    
    func clear() {
        name = ""
        description = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        source = ""
        category = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredients = [Ingredient]()
        
        recipeImage = nil
        placeHolderImage = Image("noImageAvailable")
    }
    
    func addRecipe() {
        // TODO
    }
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(tabSelection: Binding.constant(Constants.homeTab))
    }
}
