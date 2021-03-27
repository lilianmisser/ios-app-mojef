//
//  Area.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation

struct Area : Identifiable{
    let id = UUID()
    let label : String
    var games = [Game]()
    
    mutating func addGame(_ game : Game){
        games.append(game)
    }
    
    static func existsInArray(array: [Area],areaLabel : String) -> Int{
        for(index,area) in array.enumerated(){
            if(areaLabel == area.label){
                return index
            }
        }
        return -1
    }
}
