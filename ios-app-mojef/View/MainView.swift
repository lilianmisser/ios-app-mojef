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
        case .newFestival:
            break;
        default :
            break
        }
    }
    
    var body: some View {
        Text("\(festival.model.name)")
        Text("\(festival.model.date)")
        NavigationView{
            NavigationLink(destination: GameListView(games: festival.games)){
                Text("Games list")
            }
        }
    }
}

