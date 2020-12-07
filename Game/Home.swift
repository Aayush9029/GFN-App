//
//  Home.swift
//  Game
//
//  Created by Aayush Pokharel on 2020-12-06.
//

import SwiftUI
import URLImage

struct Game_struct_api : Decodable {
    let name: String
    let launcher: String
    let launcherGameId: String
    let imageUrl: String
}




struct Home : View {
    
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    @State var game_data = [Game_struct_api]()
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack{
                Title()
                    .onAppear(perform:{
                        loadJson()
                    })
                
                TextField("Search", text: self.$search)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,25)
                
                // Carousel List...
                Featured(index: index)
                
                NewGame()
                // adding custom Grid....
                
                HStack{
                    
                    Text("All Games")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: self.columns,spacing: 25){
                    
                    ForEach(game_data,id: \.launcherGameId){game in
                        GridView(game: game,columns: self.$columns)
                            .id(UUID())
                    }
                }
                .padding([.horizontal,.top])
            }
            .padding(.vertical)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}





// sample Model Data...

struct Game : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var rating : Int
}


var data = [
    
    Game(id: 0, name: "Resident Evil 3", image: "g2", rating: 3),
    Game(id: 1, name: "GTA 5", image: "g3", rating: 5),
    Game(id: 2, name: "Assaisan Creed Odesey", image: "g4", rating: 3),
    Game(id: 3, name: "Resident Evil 7", image: "g5", rating: 2),
    Game(id: 4, name: "Watch Dogs 2", image: "g6", rating: 1),
    Game(id: 5, name: "The Evil Within 2", image: "g7", rating: 2),
    Game(id: 6, name: "Tomb Raider 2014", image: "g8", rating: 4),
    Game(id: 7, name: "Shadow Of The Tomb Raider", image: "g1", rating: 4),
    
]

var middle = ["m1","m2","m3"]


//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}


extension Home{
    func loadJson(){
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Game_struct_api].self, from: data)
                DispatchQueue.main.async {
                    self.game_data = jsonData
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
}
