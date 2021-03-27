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
    }
}
