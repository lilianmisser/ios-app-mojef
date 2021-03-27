//
//  FestivalViewModel.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation

enum FestivalState: CustomStringConvertible{
    case ready
    case loading
    case loaded(Festival)
    case loadError
    case newFestival
    
    var description: String{
        switch self{
        case .ready : return "ready"
        case .loading : return "trying to load festival"
        case .loaded(let festival) : return "festival loaded"
        case .loadError : return "load error"
        case .newFestival : return "festival rendered"
        }
    }
}

class FestivalViewModel : ObservableObject{
    
    private(set) var model : Festival
    @Published private(set) var areas : [Area]
    @Published private(set) var publishers : [Publisher]
    @Published private(set) var games : [Game]
    
    @Published var festivalState : FestivalState = .ready{
        didSet{
            switch self.festivalState{
            default :
                break
            }
        }
    }
    
    init(_ festival: Festival){
        self.model = festival
        self.areas = []
        self.publishers = []
        self.games = []
    }
    
    func initWith(_ festival : Festival){
        self.model = festival
        self.newFestival();
    }
    
    func newFestival(){
        self.publishers = self.model.publishers;
        self.games = self.model.games
        self.areas = self.model.areas
        self.festivalState = .newFestival
    }

}
