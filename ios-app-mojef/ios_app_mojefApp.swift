//
//  ios_app_mojefApp.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import SwiftUI

@main
struct ios_app_mojefApp: App {
    @StateObject var festival = FestivalViewModel(Festival(name: "", date: "", games: []))
    
    var body: some Scene {
        WindowGroup {
            MainView(festival : festival)
        }
    }
}
