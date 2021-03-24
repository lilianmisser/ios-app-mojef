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
    
    
}
