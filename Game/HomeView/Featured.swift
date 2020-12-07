//
//  Featured.swift
//  Game
//
//  Created by Aayush Pokharel on 2020-12-06.
//

import SwiftUI

struct Featured: View {
    @State var index: Int
    
    var body: some View{
        HStack{
            Text("Featured")
                .font(.title2)
                .fontWeight(.bold)
            
            
            Spacer()
        }
        .padding([.horizontal, .top])
        
        TabView(selection: self.$index){
            
            ForEach(0...5,id: \.self){index in
                
                Image("p\(index)")
                    .resizable()
                    // adding animation...
                    .frame(height: self.index == index ?  230 : 180)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    // for identifying current index....
                    .tag(index)
            }
        }
        .frame(height: 230)
        .padding(.top,10)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeOut)
        
    }
}
