//
//  ImagePicker.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-08.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    // declare an environment property to read specific key path - every UIViewController has "Presentation Mode" which we use dismiss method
    @Environment(\.presentationMode) var presentationMode
    
    var selectedSource: UIImagePickerController.SourceType
    @Binding var recipeImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        // Create the image picker controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator //it calls makeCoordinator() if coordinator already doesnt exist
        
        // Check that this source is available first
        if UIImagePickerController.isSourceTypeAvailable(selectedSource) {
            imagePickerController.sourceType = selectedSource
        }
        
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        // Create coordinator
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var parent: ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // Check if we can get the image
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // We were able to get the uiimage into the image constant, pass this back to AddRecipeView
                parent.recipeImage = image
            }
            // Dismiss this view
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
