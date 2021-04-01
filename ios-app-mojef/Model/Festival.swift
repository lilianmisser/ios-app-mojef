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
    var areas : [Area] {
        get{
            var res = [Area]()
            games.forEach{ game in
                let curAreaLabel : String? = game.area_label
                if(curAreaLabel != nil){
                    let aIndex : Int = Area.existsInArray(array: res, areaLabel: curAreaLabel!)
                    if(aIndex>=0){
                        res[aIndex].addGame(game)
                    }
                    else{
                        var newArea = Area(label: curAreaLabel!)
                        newArea.addGame(game)
                        res.append(newArea)
                    }
                }
            }
            return res
        }
    }
    var publishers : [Publisher] {
        get{
            var res = [Publisher]()
            games.forEach{ game in
                let curPublisherName : String = game.publisher_name
                let pIndex : Int = Publisher.existsInArray(array: res, pname: curPublisherName)
                if(pIndex>=0){
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
    
    func getStringDateRepresentation() -> String{
        let formatDate = self.date.split(separator: ".")
        if(formatDate.count>0){
            let tmp = formatDate[0].split(separator: "T")
            if(tmp.count > 0){
                let tmpBis = tmp[0].split(separator: "-")
                if(tmpBis.count == 3){
                    return "\(tmpBis[2])/\(tmpBis[1])/\(tmpBis[0])"
                }
            }
        }
        return ""
    }
}
