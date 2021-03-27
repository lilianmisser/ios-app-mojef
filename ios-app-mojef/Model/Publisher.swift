//
//  Publisher.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation

struct Publisher : Identifiable{
    let id = UUID()
    let name : String
    var games = [Game]()
    
    static func existsInArray(array: [Publisher],pname : String) -> Int{
        for(index,publisher) in array.enumerated(){
            if(pname == publisher.name){
                return index
            }
        }
        return -1
    }
    
    mutating func addGame(_ game : Game){
        games.append(game)
    }
}
