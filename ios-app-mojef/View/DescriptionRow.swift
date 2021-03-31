//
//  DescriptionRow.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/31/21.
//

import SwiftUI

struct DescriptionRow: View {
    let name : String
    let numberOfGames : Int
    let isArea : Bool
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Image(systemName: isArea ? "pin" : "person.3")
                    Text(isArea ? "Zone " : "Editeur " + name)
                }
                HStack{
                    Image(systemName: "1.magnifyingglass")
                    Text("Nombre de jeux \(numberOfGames)")
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }.padding()
    }
}
