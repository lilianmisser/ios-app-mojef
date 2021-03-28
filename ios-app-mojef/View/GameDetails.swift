//
//  GameDetails.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct GameDetails: View {
    let game : Game
    
    var body: some View {
        Text("\(game.game_name)")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        List{
            HStack{
                Image(systemName: "person.crop.circle")
                Text("\(game.game_minAge)+")
            }
            HStack{
                Image(systemName: "person.3")
                Text("\(game.getPlayersSummary())")
            }
            HStack{
                Image(systemName: "hourglass")
                Text("Durée : \(game.game_duration)")
            }
            HStack{
                Image(systemName: "pin")
                Text("Zone: \(game.area_label != nil ? game.area_label! : "Pas encore attribué")")
            }
            HStack{
                Image(systemName: "bookmark")
                Text("Type : \(game.game_type)")
            }
        }
    }
}
