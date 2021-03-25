//
//  GameListView.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

struct GameListView: View {
    @ObservedObject var gameList : GameListVM
    var intent : GameListIntent
    
    init(gameList : GameListVM){
        self.gameList = gameList
        self.intent = GameListIntent(viewModel: gameList)
        let _ = self.gameList.$gameListState.sink(receiveValue: stateChanged)
    }
    
    func stateChanged(state: GameListState){
        switch state{
        case .newGames:
            self.intent.gamesLoaded()
        default :
            break
        }
    }
    
    var body: some View {
        VStack{
            Text("Current festival game list")
            List{
                ForEach(self.gameList.games){ game in
                    HStack{
                        Text("Nom : \(game.name)")
                        Text("Type : \(game.type)")
                        Text("Age Min : \(game.minAge)")
                    }
                }
            }
        }
    }
}
