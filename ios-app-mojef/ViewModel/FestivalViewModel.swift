//
//  FestivalViewModel.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation
import Combine

enum FestivalState: CustomStringConvertible{
    case loading
    case loaded
    case loadError(HttpRequestError)
    
    var description: String{
        switch self{
        case .loading : return "trying to load festival"
        case .loaded : return "festival loaded"
        case .loadError( _) : return "load error"
        }
    }
}

class FestivalViewModel : ObservableObject{
    
    @Published private(set) var model : Festival
    @Published private(set) var areas : [Area]
    @Published private(set) var publishers : [Publisher]
    @Published private(set) var games : [Game]
    
    @Published var festivalState : FestivalState = .loaded{
        didSet{
            debugPrint("FestivalState = \(festivalState)")
            switch self.festivalState{
            case .loading:
                self.loadFestival()
                break;
            default :
                break
            }
        }
        willSet{
            self.objectWillChange.send()
        }
    }
    
    init(_ festival: Festival){
        self.model = festival
        self.areas = []
        self.publishers = []
        self.games = []
        self.festivalState = .loading
    }
    
    func initWith(_ festival : Festival){
        self.model = festival
        self.newFestival();
    }
    
    func newFestival(){
        self.publishers = self.model.publishers;
        self.games = self.model.games
        self.areas = self.model.areas
    }

    let gamesEndpoint = "https://mojef.florent.best/api/festival/current"
    
    func loadFestival(){
        ApiHelper.httpGetJsonData(from: gamesEndpoint, endofrequest: httpCallback)
    }
    
    func httpCallback(result: Result<Festival,HttpRequestError>){
        switch result {
        case .success(let data):
            self.initWith(data)
            self.festivalState = .loaded
        case .failure(let error):
            self.festivalState = .loadError(error)
        }
    }
}
