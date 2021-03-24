//
//  GameListIntent.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation

class GameListIntent {
    @ObservedObject var viewModel : GameListVM
    
    init(viewModel: GameListVM){
        self.viewModel = viewModel
    }
    
    func load(){
        self.viewModel.gameListState = .loading
    }
    
    func loaded(games : [Game]){
        self.viewModel.gameListState = .newGames
    }
    
    func loadingError(){
        self.viewModel.gameListState = .ready
    }
    
    func gamesLoaded(){
        self.viewModel.gameListState = .ready
    }

}
