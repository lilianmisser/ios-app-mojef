//
//  ios_app_mojefApp.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

@main
struct ios_app_mojefApp: App {
    @Environment(\.scenePhase) private var lifecycle
    @StateObject var festival = FestivalViewModel(Festival(name: "", date: "", games: []))
    
    let gamesEndpoint = "https://mojef.florent.best/api/festival/current"
    
    init(){
        
    }
    
    func loadFestival(){
        ApiHelper.httpGetJsonData(from: gamesEndpoint, endofrequest: httpCallback)
    }
    
    func httpCallback(result: Result<Festival,HttpRequestError>){
        switch result {
        case .success(let data):
            self.festival.initWith(data)
        case .failure:
            break
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(festival : festival)
        }.onChange(of: lifecycle){ phase in
            switch phase{
            case .active:
                self.loadFestival()
            case .background:
                break
            case .inactive:
                break
            @unknown default:
                fatalError("unknown application lifecycle phase")
            }
            
        }
    }
}
