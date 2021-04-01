//
//  MainView.swift
//  ios-app-mojef
//
//  Created by etud on 25/03/2021.
//

import SwiftUI

struct MainView: View{
    @State private var selectedTab = 1
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
                TabView(selection: $selectedTab){
                    PublishersPage(publishers: festival.publishers, onRefresh: onRefresh)
                        .onTapGesture {
                                self.selectedTab = 0
                        }
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Editeurs")
                        }
                        .tag(0)
                        .navigationBarHidden(true)
                    
                    FestivalPage(festival: festival.model, onRefresh: onRefresh)
                        .onTapGesture {
                            self.selectedTab = 1
                        }
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Festival")
                        }
                        .tag(1)
                        .navigationBarHidden(true)
                    
                    AreasPage(areas: festival.areas, onRefresh: onRefresh)
                        .onTapGesture {
                            self.selectedTab = 2
                        }
                        .tabItem {
                            Image(systemName: "location")
                            Text("Zones")
                        }
                        .tag(2)
                        .navigationBarHidden(true)
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

