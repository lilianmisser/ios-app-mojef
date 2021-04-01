//
//  AreaListView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct AreaListView: View {
    let areas : [Area]
    let onRefresh : () -> Void
    @State private var searchInput = ""
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text("Zones")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                Spacer()
            }
            .frame(minHeight: 60)
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(areas.filter{searchInput.isEmpty ? true : $0.label.lowercased().contains(searchInput.lowercased())}){ area in
                        NavigationLink(destination: GameListView(games: area.games, title : "Zone \(area.label)", onRefresh: onRefresh)){
                            DescriptionRow(name: area.label, numberOfGames: area.games.count, isArea: true)
                        }.foregroundColor(.black).background(Color.white)
                    }
                }
            }
            Spacer().frame(height:10)
            SearchBar(searchInput: $searchInput)
            Spacer().frame(height:10)
        }
        .background(Color(.systemGray5).ignoresSafeArea())
    }
}

