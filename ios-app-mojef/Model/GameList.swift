//
//  GameList.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation

protocol GameListDelegate {
    func overwriteList(games: [Game])
}

class GameList : ObservableObject{
    var delegate : GameListDelegate?
    
    private(set) var games = [Game]()
    
    init(_ games : [Game]){
        self.games = games
    }
    
    func overwrite(_ games : [Game]){
        self.games = games
        self.delegate?.overwriteList(games: games)
    }
    
    func addGame(_ game : Game){
        self.games.append(game)
    }
}
