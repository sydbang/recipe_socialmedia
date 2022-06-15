//
//  IngredientListView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-10.
//

import SwiftUI

struct IngredientListView: View {
    var body: some View {
        VStack {
            HStack {
                
                Button {} label: {
                    ButtonView(text: "metric")
                }
                Button {} label: {
                    ButtonView(text: "imperial")
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView()
    }
}
