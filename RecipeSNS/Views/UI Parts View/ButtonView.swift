//
//  ButtonView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-14.
//

import SwiftUI

struct ButtonView: View {
    
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
                .cornerRadius(5)
                .shadow(radius: 4)
            
            Text(text)
        }
        .frame(height: 40)
        .foregroundColor(.white)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Hello")
    }
}
