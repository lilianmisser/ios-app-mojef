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
        //print("refreshing data")
        intent.load()
    }
    
    var body: some View {
        if case .loaded = festival.festivalState{
            NavigationView{
                TabView{
                    FestivalPage(festival: festival.model, onRefresh: onRefresh)
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Festival")
                    }.navigationBarHidden(true)
                    
                    PublishersPage(publishers: festival.publishers, onRefresh: onRefresh)
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Editeurs")
                    }.navigationBarHidden(true)
                    
                    AreasPage(areas: festival.areas, onRefresh: onRefresh)
                    .tabItem {
                        Image(systemName: "location")
                        Text("Zones")
                    }.navigationBarHidden(true)
                }
            }
        }
        else if case .loading = festival.festivalState{
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            }
        }
        else if case .loadError(let error) = festival.festivalState {
            VStack{
                Text("Erreur technique: \(error.description), veuillez contacter les administrateurs")
            }
        }
        else {
            VStack{
                Text("Unexepected")
            }
        }
    }
}

