//
//  GameListVM.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation

enum GameListState: CustomStringConvertible{
    case ready
    case loading
    case loaded([Game])
    case loadError
    case newGames
    
    var description: String{
        switch self{
        case .ready : return "ready"
        case .loading : return "trying to load games"
        case .loaded(let gameList) : return "loaded \(gameList.count) tracks"
        case .loadError : return "load error"
        case .newGames : return "return games have been added to list"
        }
    }
}

class GameListVM : GameListDelegate, ObservableObject{
    
    @Published private(set) var model : GameList
    
    @Published var gameListState : GameListState = .ready{
        didSet{
            switch self.gameListState{
            case .loading :
                print("loading")
            case let .loaded(gameList) :
                print("loaded")
            case .loadError :
                print("loadError")
            default :
                break
            }
        }
    }
    
    init(_ gameList: GameList){
        self.model = gameList
        self.model.delegate = self
    }
    
    func overwriteList(games: [Game]) {
        //fetch api-url/api/currentFestival/games
        // loaded -> overwrite
        // loadError -> stay same and change state
    }
}
