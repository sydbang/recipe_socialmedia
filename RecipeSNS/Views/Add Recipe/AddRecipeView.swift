//
//  AddRecipeView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-06.
//

import SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject var userModel: UserModel
    @EnvironmentObject var recipeModel: RecipeModel
    
    // Tab selection - to return the user back to tab views
    @Binding var tabSelection: Int
    
    @Binding var isShowingAddRecipeView: Bool
    
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
                VStack {
                    Button("< Back") {
                        isShowingAddRecipeView = false
                    }
                    
                    Button("Clear") {
                        clear()
                    }
                    
                }
                
                Spacer()
                Button("Add") {
                    //recipeModel.addRecipe(authorId: userModel.user.userId, name: name, description: description, prepTimeMin: prepTime, cookTimeMin: cookTime, totalTimeMin: totalTime, servings: servings, category: category, source: source)
                    clear()
                    tabSelection = Constants.profileTab
                }
            }
            
            // Scroll view
            ScrollView (showsIndicators: false){
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
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedSource: selectedImageSource, recipeImage: $recipeImage)
                    }
                    
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
                    
                    // Ingredients
                    AddIngredientData(ingredients: $ingredients)
                }
            }
        }
        .padding()
        .navigationBarHidden(true)
    }
    
    func loadImage() {
        // Check if an image was selected from the library
        if recipeImage != nil {
            placeHolderImage = Image(uiImage: recipeImage!)
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
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(tabSelection: Binding.constant(Constants.homeTab), isShowingAddRecipeView: Binding.constant(true))
    }
}
