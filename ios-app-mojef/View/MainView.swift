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
    @State var mainState : FestivalState = .loading
    init(festival : FestivalViewModel){
        self.festival = festival
        self.intent = FestivalIntent(viewModel: festival)
        let _ = festival.$festivalState.sink(receiveValue: stateChanged)
        self.intent.load()
        
    }
    
    func stateChanged(state: FestivalState){
        print("allo")
        self.mainState = state
    }
    
    var body: some View {
        if case .loaded = self.mainState{
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
        else if case .loading = self.mainState{
            VStack{
                Text("loading")
            }
        }
        else if case .loadError(let error) = self.mainState {
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

