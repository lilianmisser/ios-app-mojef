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
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
            }
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(games){ game in
                        NavigationLink(destination: GameDetails(game : game)){
                            GameRow(game: game)
                        }.foregroundColor(.black).background(Color.white)
                    }
                }
            }
        }.background(Color.black.opacity(0.10).ignoresSafeArea())
    }
}
