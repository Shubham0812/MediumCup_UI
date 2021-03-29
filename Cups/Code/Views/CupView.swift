//
//  ContentView.swift
//  Cups
//
//  Created by Shubham on 17/02/21.
//

import SwiftUI

struct CupView: View {
    
    // MARK:- variables
    var width: CGFloat = 300
    var height: CGFloat = 300
    
    var curveHeight: CGFloat = 5
    var curveLength: CGFloat = 7
    
    let animationDuration: TimeInterval = 0.6
    
    var color = Color(hex: "155498")
    var logo = "pepsi"

    // MARK:- views
    var body: some View {
        ZStack {
            MediumCupShape()
                .stroke(lineWidth: 3)
                .shadow(radius: 4)
            ZStack {
                color
            }
            .mask(MediumCupShape())
            CapView()
                .shadow(radius: 2)
            Image("pepsi")
                .resizable()
                .frame(width: 78, height: 78)
                .shadow(radius: 4)
                .overlay(Circle()
                            .stroke(style: StrokeStyle(lineWidth: 3))
                            .foregroundColor(.white)
                            .scaleEffect(0.9))
                .offset(y: -6)
                .animation(Animation.default)
        }
        .scaleEffect(1.25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.lightBlue
                .edgesIgnoringSafeArea(.all)
            CupView()
        }
    }
}
