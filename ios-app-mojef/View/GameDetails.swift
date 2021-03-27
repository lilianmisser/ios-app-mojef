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
        VStack{
            Text("\(game.game_name)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("Type : \(game.game_type)")
            Text("Durée : \(game.game_duration)")
            Text("Nombre de joueurs: \(game.getPlayersSummary())")
            Text("Age: \(game.game_minAge)+")
            Text("Zone: \(game.area_label != nil ? game.area_label! : "Pas de zone")")
        }
    }
}
