//
//  SearchBar.swift
//  ios-app-mojef
//
//  Created by etud on 01/04/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchInput : String
    @State private var isEditing : Bool = false
    
    func onCancel() {
        self.isEditing = false
        self.searchInput = ""
    }
    
    var body: some View {
            HStack{
                TextField("Aa", text: $searchInput)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 30)
                    .background(Color(.systemGray5))
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing{
                    Button(action: onCancel){
                        Image(systemName: "multiply")
                    }
                }
            }
        .background(Color.white)
    }
}

