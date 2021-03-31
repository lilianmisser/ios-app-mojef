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
    
    func loadingError(_ error: HttpRequestError){
        self.viewModel.festivalState = .loadError(error)
    }

}
