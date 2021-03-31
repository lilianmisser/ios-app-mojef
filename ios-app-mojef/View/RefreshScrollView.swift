//
//  RefreshScrollView.swift
//  ios-app-mojef
//
//  Created by user188901 on 3/31/21.
//

import SwiftUI

struct Refresh{
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released : Bool
    var invalid : Bool = false
    var refreshGap : CGFloat = 90
}
	
struct RefreshScrollView<Content: View>: View {
    //Our children view
    var content : Content
    //our closure to handle refresh
    var onRefresh : () -> Void
    @State var refresh = Refresh(started: false, released: false)

    init(onRefresh: @escaping () -> Void,@ViewBuilder content : () -> Content){
        self.content = content()
        self.onRefresh = onRefresh
    }
    
    func update(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation(Animation.linear){
                if(refresh.offset == refresh.startOffset){
                    onRefresh()
                    refresh.released = false
                    refresh.started = false
                }
                else{
                    refresh.invalid = true
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content : {
            //Geometry Reader keeping track of the users actions
            GeometryReader{reader-> AnyView in
                
                DispatchQueue.main.async{
                    //initializing the start offset
                    if(refresh.startOffset == 0){
                        refresh.startOffset = reader.frame(in: .global).minY
                    }
                    
                    //binding the actual offset that will change
                    refresh.offset = reader.frame(in: .global).minY
                    
                    //if the user scroll more than refresh.refreshGap then he started = true (if it was not already started)
                    if(refresh.offset - refresh.startOffset > refresh.refreshGap && !refresh.started){
                        refresh.started = true
                    }
                    
                    //if the refresh is started and the user scrolls backs to initial offset
                    //thats means he just released
                    if(refresh.startOffset == refresh.offset && refresh.started && !refresh.released){
                        withAnimation(Animation.linear){refresh.released = true}
                        update()
                    }
                    
                    //If we're in an invalid state we check until he comes backs in a valid state
                    if(refresh.startOffset == refresh.offset && refresh.started && refresh.released && refresh.invalid){
                        refresh.invalid = false
                        update()
                    }
                }
                //We need to return a view in geometry reader since we're in body
                return AnyView(Color.white.frame(width: 0, height: 0))
            }
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                if refresh.started && refresh.released {
                    ProgressView().offset(y: -35)
                }
                else  {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                        .offset(y: -25)
                        .animation(.easeIn)
                }
                VStack{
                    self.content
                }
            }
            .offset(y : refresh.released ? 40 : -10)
        })
    }
}
