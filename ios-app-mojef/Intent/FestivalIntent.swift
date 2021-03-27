//
//  FestivalIntent.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/27/21.
//

import Foundation
import SwiftUI

class FestivalIntent {
    @ObservedObject var viewModel : FestivalViewModel
    
    init(viewModel: FestivalViewModel){
        self.viewModel = viewModel
    }
    
    func load(){
        self.viewModel.festivalState = .loading
    }
    
    func loaded(festival : Festival){
        self.viewModel.festivalState = .newFestival(festival)
    }
    
    func loadingError(){
        self.viewModel.festivalState = .ready
    }
    
    func gamesLoaded(){
        self.viewModel.festivalState = .ready
    }
    
    func httpJsonLoaded(result: Result<Festival,HttpRequestError>){
        switch result {
        case let .success(data):
            self.viewModel.festivalState = .loaded(data)
        case let .failure(error):
            self.viewModel.festivalState = .loadError
        }
    }

}
