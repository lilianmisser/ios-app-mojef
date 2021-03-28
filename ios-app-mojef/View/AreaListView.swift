//
//  AreaListView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct AreaListView: View {
    let areas : [Area]
    var body: some View {
        VStack{
            List{
                ForEach(areas){ area in
                    NavigationLink(
                        destination: GameListView(games: area.games, title : "Zone \(area.label)")){
                        HStack{
                            Text("Nom : \(area.label)")
                            Text("Nombre de jeux : \(area.games.count)")
                        }
                    }
                }
            }.navigationTitle("Liste des zones")
        }
    }
}

