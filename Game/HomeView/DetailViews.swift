//
//  DetailViews.swift
//  Game
//
//  Created by Aayush Pokharel on 2020-12-06.
//

import SwiftUI

struct Title: View {
    var body: some View{
        
        HStack{
            
            Text("GFN Games")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
