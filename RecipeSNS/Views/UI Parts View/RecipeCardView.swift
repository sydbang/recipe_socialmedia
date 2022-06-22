//
//  RecipeCardView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-10.
//

import SwiftUI

struct RecipeCardView: View {
    
    var r: Recipe
    
    var body: some View {
        
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                HStack (spacing: 0) {
                    Image ("noImageAvailable")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: 150, height: 150)
                        .padding(.vertical)
                    VStack {
                        Text("Eggplant rice")
                            .padding(5)
                            .font(Font.custom("Avenir", size: 15))
                        Text("Time to prep: ")
                        Text("Time to cook: ")
                        Text("Category: ")
                        Text("Highlights: ")
                    }
                }
                .frame(maxWidth: . infinity, alignment: .center)
            }
            .cornerRadius(15)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            .fixedSize(horizontal: false, vertical: true)

            
        
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(r: Recipe())
    }
}
