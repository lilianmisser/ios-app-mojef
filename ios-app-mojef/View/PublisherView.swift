//
//  PublisherView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import SwiftUI

struct PublisherView: View {
    let publisher : Publisher
    var body: some View {
        Text("Jeux de l'éditeur \(publisher.name)")
        GameListView(games: publisher.games)
    }
}
