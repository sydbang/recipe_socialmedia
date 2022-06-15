//
//  SearchBarView.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-03.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var filterBy: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius: 4)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Filter by ...", text: $filterBy)
                
                Button {
                    // Clear the text field
                    filterBy = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                }
            }
            .padding()
        }
        .frame(height: 40)
        .foregroundColor(.white)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(filterBy: Binding.constant(""))
    }
}
