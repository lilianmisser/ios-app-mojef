//
//  GameListView.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

struct GameListView: View {
    let games : [Game]
    let title : String
    let onRefresh:() -> Void
    @State private var searchInput : String = ""
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                Spacer()
            }.frame(minHeight: 60)
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(games.filter({searchInput.isEmpty ? true : $0.game_name.lowercased().contains(searchInput.lowercased())})){ game in
                        NavigationLink(destination: GameDetails(game : game)){
                            GameRow(game: game)
                        }
                        .foregroundColor(.black)
                        .background(Color.white)
                    }
                }
            }
            SearchBar(searchInput: $searchInput)
        }
        .background(Color.black.opacity(0.10).ignoresSafeArea())
    }
}
