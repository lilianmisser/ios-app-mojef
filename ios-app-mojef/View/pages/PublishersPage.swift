//
//  PublishersPage.swift
//  ios-app-mojef
//
//  Created by user188901 on 4/1/21.
//

import SwiftUI

struct PublishersPage: View {
    let publishers : [Publisher]
    let onRefresh : () -> Void
    @State private var searchInput = ""
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text("Editeurs")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                Spacer()
            }.frame(minHeight: 60)
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(publishers.filter{searchInput.isEmpty ? true : $0.name.lowercased().contains(searchInput.lowercased())}){ publisher in
                        NavigationLink(destination: GameListView(games: publisher.games,title : "\(publisher.name)", onRefresh: onRefresh)){
                            DescriptionRow(name: publisher.name, numberOfGames: publisher.games.count, isArea: false)
                        }
                        .foregroundColor(.black).background(Color.white)
                    }
                }
            }
            Spacer().frame(height:10)
            SearchBar(searchInput: $searchInput)
            Spacer().frame(height:10)
        }.background(Color(.systemGray5).ignoresSafeArea())
    }
}
