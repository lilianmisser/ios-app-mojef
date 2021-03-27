//
//  AreaView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/28/21.
//

import SwiftUI

struct AreaView: View {
    let area : Area
    var body: some View {
        Text("Jeux de la zone \(area.label)")
        GameListView(games: area.games)
        
    }
}
