//
//  PublisherListView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct PublisherListView: View {
    let publishers : [Publisher]
    let onRefresh : () -> Void
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text("Editeurs")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
            }
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(publishers){ publisher in
                        NavigationLink(destination: GameListView(games: publisher.games,title : "\(publisher.name)", onRefresh: onRefresh)){
                            DescriptionRow(name: publisher.name, numberOfGames: publisher.games.count, isArea: false)
                        }.foregroundColor(.black).background(Color.white)
                    }
                }
            }
        }.background(Color.black.opacity(0.10).ignoresSafeArea())
    }
}


