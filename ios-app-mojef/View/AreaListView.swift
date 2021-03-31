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
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Text("Zones")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
            }
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            RefreshScrollView(onRefresh: onRefresh){
                VStack{
                    ForEach(areas){ area in
                        NavigationLink(destination: GameListView(games: area.games, title : "Zone \(area.label)", onRefresh: onRefresh)){
                            DescriptionRow(name: area.label, numberOfGames: area.games.count, isArea: true)
                        }.foregroundColor(.black).background(Color.white)
                    }
                }
            }
        }.background(Color.black.opacity(0.10).ignoresSafeArea())
    }
}

