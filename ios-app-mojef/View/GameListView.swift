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
            print("newGames")
        default :
            break
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        
    }
}
