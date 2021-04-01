//
//  FestivalPage.swift
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
                Text("Bienvenue au Festival du jeu de Montpellier")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                Spacer()
            }
            .frame(minHeight: 60)
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            Divider()
            VStack{
                Text("Entrée")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Comme tous les ans depuis sa création, l’entrée du festival est libre et gratuite. Cela nous tient particulièrement à coeur afin de faire découvrir les jeux au plus grand nombre.")
            }
            Divider()
            VStack{
                Text("Date")
                .font(.headline)
                .fontWeight(.bold)
                Text("Il se déroulera le \(festival.getStringDateRepresentation())")
            }
            Divider()
            VStack{
                Text("Lieu")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("2ème et 3ème étages du Corum de Montpellier, au bout de l’esplanade Charles de Gaulle, en haut des marches.")
                Text("Personnes à mobilité réduite : le Corum est accessible par l’entrée située au niveau 1, côté Est (au niveau de la sortie piétons du parking Corum).")
            }
            Divider()
            VStack{
                Text("Jeux et éditeurs")
                .font(.headline)
                .fontWeight(.bold)
                Text("Il y a \(festival.games.count) jeux présentés avec \(festival.publishers.count) éditeurs différents !")
                
            }
            NavigationLink(
                destination: GameListView(games: festival.games, title: "Tous les jeux", onRefresh: onRefresh)){
                Text("Voir les jeux du festival")
            }
        }
    }
}
