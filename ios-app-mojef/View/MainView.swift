//
//  MainView.swift
//  ios-app-mojef
//
//  Created by etud on 25/03/2021.
//

import SwiftUI

struct MainView: View{
    @ObservedObject var festival : FestivalViewModel
    var intent : FestivalIntent
    
    init(festival: FestivalViewModel){
        self.festival = festival
        self.intent = FestivalIntent(viewModel: festival)
        let _ = festival.$festivalState.sink(receiveValue: stateChanged)
    }
    
    func stateChanged(state: FestivalState){
        switch state{
        case .loaded:
            break;
        default :
            break
        }
    }
    
    var body: some View {
        TabView{
            NavigationView{
                GameListView(games: festival.games,title : "Tous les jeux")
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Jeux")
            }
            NavigationView{
                PublisherListView(publishers: festival.publishers)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Editeurs")
            }
            NavigationView{
                AreaListView(areas: festival.areas)
            }
            .tabItem {
                Image(systemName: "location")
                Text("Zones")
            }
        }
    }
}

