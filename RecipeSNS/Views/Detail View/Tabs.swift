//
//  Tabs.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-10.
//

import SwiftUI

struct Tab {
    var icon: Image?
    var title: String
    
    init(icon: Image, title: String) {
        self.icon = icon
        self.title = title
    }
}

struct Tabs: View {
    
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView (showsIndicators: false){
            ScrollViewReader { proxy in
                VStack {
                    HStack {
                        ForEach(0..<tabs.count, id: \.self) { col in
                            Button (action: {
                                withAnimation {
                                    selectedTab = col
                                }
                            }, label: {
                                VStack {
                                    HStack {
                                        // Image
                                        AnyView(tabs[col].icon)
                                            .foregroundColor(.white)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                                        
                                        // Text
                                        Text(tabs[col].title)
                                            .foregroundColor(.white)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: geoWidth/CGFloat(tabs.count), height: 52)
                                    // Bar indicator
                                    Rectangle().fill(selectedTab == col ? Color.white : Color.clear)
                                        .frame(height: 3)
                                }.fixedSize()
                            })
                            .accentColor(.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            
        }
    }
}
//
//struct Tabs_Previews: PreviewProvider {
//    static var previews: some View {
//        Tabs()
//    }
//}
