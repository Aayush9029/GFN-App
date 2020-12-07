//
//  GridView.swift
//  Game
//
//  Created by Aayush Pokharel on 2020-12-06.
//

import SwiftUI
import URLImage


struct GridView : View {
    
    var game : Game_struct_api
    @Binding var columns : [GridItem]

    
    var body: some View{
        VStack{
                VStack(spacing: 15){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        URLImage(url: URL(string:game.imageUrl)!,
//                                      options: URLImageOptions(
//                                      ),
                                 inProgress: { progress -> Text in  // Display progress
                                    if progress != nil {
                                        return Text("\(progress!)/1 Done")
                                                     }
                                     else {
                                        return Text("Loading...")
                                     }
                                                  },
                                 
                                 failure: { error, retry in         // Display error and retry button
                                    VStack {
                                        Text(error.localizedDescription)
                                        Button("Retry", action: retry)
                                    }
                                 },
                                      content: { image in
                                         image
                                             .resizable()
                                             .aspectRatio(contentMode: .fit)
                                      })
                    
   
//                        Button {
//
//                        } label: {
//
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(.pink)
//                                .padding(.all,10)
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        }
//                        .padding(.all,10)
//
                    }
                    
                    Text(game.name)
//                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
//                    Button {
//
//                    } label: {
//
//                        Text("See Details")
//                            .foregroundColor(.white)
//                            .padding(.vertical,10)
//                            .padding(.horizontal,25)
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
                    
                }
        }
    }
}
