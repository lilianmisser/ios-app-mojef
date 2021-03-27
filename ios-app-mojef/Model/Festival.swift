//
//  Festival.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation

struct Festival : Codable {
    let name : String
    let date : String
    let games : [Game]
    var publishers : [Publisher] {
        get{
            var res = [Publisher]()
            games.forEach{ game in
                let curPublisherName : String = game.publisher_name
                let pIndex : Int = Publisher.existsInArray(array: res, pname: curPublisherName)
                if(pIndex>0){
                    res[pIndex].addGame(game)
                }
                else{
                    var newP = Publisher(name: curPublisherName)
                    newP.addGame(game)
                    res.append(newP)
                }
            }
            return res
        }
    }
}
