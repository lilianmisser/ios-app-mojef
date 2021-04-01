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
            Spacer().frame(height:10)
            SearchBar(searchInput: $searchInput)
            Spacer().frame(height:10)
        }
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                }
        .background(Color(.systemGray5).ignoresSafeArea())
    }
}
