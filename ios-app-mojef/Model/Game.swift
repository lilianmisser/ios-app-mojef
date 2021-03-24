//
//  Game.swift
//  ios-app-mojef
//
//  Created by etud on 24/03/2021.
//

import Foundation

struct Game{
    private(set) var id: String
    private(set) var name: String
    private(set) var minPlayers: Int
    private(set) var maxPlayers: Int
    private(set) var minAge: Int
    private(set) var maxAge: Int
    private(set) var guideLink: String?
    private(set) var isPrototype: Bool
    private(set) var type: String
}


