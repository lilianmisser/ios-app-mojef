//
//  GameListView.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

struct GameListView: View {
    let games : [Game]
    
    var body: some View {
        VStack{
            List{
                ForEach(games){ game in
                    NavigationLink(destination: GameDetails(game : game)){
                        HStack{
                            Text("Nom : \(game.game_name)")
                            Text("Type : \(game.game_type)")
                            Text("Age Min : \(game.game_minAge)")
                        }
                    }
                }
            }
        }
    }
}
