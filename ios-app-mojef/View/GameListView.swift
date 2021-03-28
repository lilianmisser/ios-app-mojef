//
//  GameListView.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

struct GameListView: View {
    let games : [Game]
    let title : String
    var body: some View {
        VStack{
            List{
                ForEach(games){ game in
                    NavigationLink(destination: GameDetails(game : game)){
                        GameRow(game: game)
                    }
                }
            }.navigationTitle(title)
        }
    }
}
