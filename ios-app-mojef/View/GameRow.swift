//
//  GameRow.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/28/21.
//

import SwiftUI

struct GameRow: View {
    let game : Game
    var body: some View {
        HStack{
            Text("\(game.game_name)")
                .fontWeight(.semibold)
            VStack{
                HStack{
                    Image(systemName: "person.3")
                    Text("\(game.game_minPlayers)-\(game.game_maxPlayers)")
                }
                HStack{
                    Image(systemName: "person.crop.circle")
                    Text("\(game.game_minAge)+")
                }
                
            }
        }
    }
}

