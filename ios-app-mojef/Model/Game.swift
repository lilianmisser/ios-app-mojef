//
//  Game.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation

struct Game : Codable, Identifiable{
    let id = UUID()
    let game_name: String
    let game_duration : String
    let game_type : String
    let game_minAge : Int
    let game_maxAge : Int
    let game_minPlayers : Int
    let game_maxPlayers : Int
    let game_isPrototype : Bool
    let game_guidelink : String?
    let publisher_name : String
    let area_label : String?
    
    func getPlayersSummary() -> String{
        if(game_minPlayers == game_maxPlayers){
            return("\(game_minPlayers) joueurs requis")
        }
        else{
            return("De \(game_minPlayers) à \(game_maxPlayers) joueurs")
        }
    }
}


