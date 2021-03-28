//
//  GameDetails.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct GameDetails: View {
    let game : Game
    let columns : [GridItem] = [GridItem(.fixed(50)),GridItem(.fixed(300))]
    
    var body: some View {
        ScrollView{
            Text("\(game.game_name)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            LazyVGrid(columns: columns, alignment: .leading){
                Image(systemName: "person.crop.circle")
                Text("\(game.game_minAge)+")
                Image(systemName: "person.3")
                Text("\(game.getPlayersSummary())")
                Image(systemName: "hourglass")
                Text("Durée : \(game.game_duration)")
                Image(systemName: "pin")
                Text("Zone: \(game.area_label != nil ? game.area_label! : "Pas encore attribué")")
                Image(systemName: "bookmark")
                Text("Type : \(game.game_type)")
            }
        }
    }
}
