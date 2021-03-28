//
//  PublisherListView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct PublisherListView: View {
    let publishers : [Publisher]
    var body: some View {
        VStack{
            List{
                ForEach(publishers){ publisher in
                    NavigationLink(
                        destination: GameListView(games: publisher.games,title : "\(publisher.name)")){
                        HStack{
                            Text("Nom : \(publisher.name)")
                            Text("Nombre de jeux : \(publisher.games.count)")
                        }
                    }
                }
            }.navigationTitle("Editeurs")
        }
    }
}


