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
        print(festival.games)
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
        NavigationView{
            NavigationLink(destination: Text("Test")){
                Text("Test")
            }
        }.navigationBarTitle("\(festival.model.name)")
    }
}
