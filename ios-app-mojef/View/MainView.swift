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
    
    init(festival : FestivalViewModel){
        self.festival = festival
        self.intent = FestivalIntent(viewModel: festival)
    }
    
    func onRefresh() -> Void {
        print("refreshing data")
        intent.load()
    }
    
    var body: some View {
        if case .loaded = festival.festivalState{
            TabView{
                NavigationView{
                    GameListView(games: festival.games,title : "Tous les jeux", onRefresh: onRefresh)
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Jeux")
                }
                NavigationView{
                    PublisherListView(publishers: festival.publishers, onRefresh: onRefresh)
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Editeurs")
                }
                NavigationView{
                    AreaListView(areas: festival.areas, onRefresh: onRefresh)
                }
                .tabItem {
                    Image(systemName: "location")
                    Text("Zones")
                }
            }
        }
        else if case .loading = festival.festivalState{
            VStack{
                Text("loading")
            }
        }
        else if case .loadError(let error) = festival.festivalState {
            VStack{
                Text(error.description)
            }
        }
        else {
            VStack{
                Text("else main")
            }
        }
    }
}

