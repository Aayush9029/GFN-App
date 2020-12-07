//
//  ContentView.swift
//  Game
//
//  Created by Balaji on 26/06/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            
            Home().tabItem {
                Image(systemName: "house")
            }
            
            Text("News").tabItem{
                Image(systemName: "newspaper")
            }
            
            Text("Liked").tabItem {
                Image(systemName: "heart")
            }
            Text("Menu").tabItem {
                Image(systemName: "gear")
            }
        }
                .accentColor(.green)
            .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



