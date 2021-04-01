//
//  GamesPage.swift
//  ios-app-mojef
//
//  Created by user188901 on 4/1/21.
//

import SwiftUI

struct FestivalPage: View {
    var festival : Festival
    var onRefresh: () -> Void
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Bienvenue au \(festival.name)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                Spacer()
            }.frame(minHeight: 60)
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Spacer()
            Text("Il se déroulera  à \(festival.date)")
            Text("Rendez vous au Corum")
            Text("Il y a \(festival.games.count) présentées avec \(festival.publishers.count) éditeurs différents !")
            NavigationLink(
                destination: GameListView(games: festival.games, title: "Tous les jeux", onRefresh: onRefresh)){
                Text("Go to")
            }
        }
    }
}
