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
    @StateObject var gameList = GameListVM(GameList([]))
    
    let gamesEndpoint = "https://mojef.florent.best/api/game"
    
    init(){
        
    }
    
    func loadGames(){
        ApiHelper.httpGetJsonData(from: gamesEndpoint, endofrequest: httpCallback)
    }
    
    func httpCallback(result: Result<[GameData],HttpRequestError>){
        switch result {
        case .success(let data):
            self.gameList.initWith(data: data)
        case .failure:
            break
        }
    }
    
    var body: some Scene {
        WindowGroup {
            GameListView(gameList: gameList)
        }.onChange(of: lifecycle){ phase in
            switch phase{
            case .active:
                self.loadGames()
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
