//
//  GameListIntent.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation
import SwiftUI

class GameListIntent {
    @ObservedObject var viewModel : GameListVM
    
    init(viewModel: GameListVM){
        self.viewModel = viewModel
    }
    
    func load(){
        self.viewModel.gameListState = .loading
    }
    
    func loaded(games : [Game]){
        self.viewModel.gameListState = .newGames(games)
    }
    
    func loadingError(){
        self.viewModel.gameListState = .ready
    }
    
    func gamesLoaded(){
        self.viewModel.gameListState = .ready
    }
    
    func httpJsonLoaded(result: Result<[GameData],HttpRequestError>){
        switch result {
        case let .success(data):
            let games = ApiHelper.gameDataToGames(data)
            self.viewModel.gameListState = .loaded(games)
        case let .failure(error):
            self.viewModel.gameListState = .loadError
        }
    }

}
