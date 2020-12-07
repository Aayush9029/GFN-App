//
//  NewGame.swift
//  Game
//
//  Created by Aayush Pokharel on 2020-12-06.
//

import SwiftUI


struct NewGame : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            HStack{
                Text("Recently Updated")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                Spacer()
            }
            .padding([.horizontal, .top])
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(middle,id: \.self){i in
                        Image(i)
                            .cornerRadius(15)
//                            .padding(.horizontal)
                    }
                }
                
            }.padding()
        }
    }
}




struct NewGame_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
