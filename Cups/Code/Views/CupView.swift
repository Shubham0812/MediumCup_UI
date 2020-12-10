//
//  ContentView.swift
//  Cups
//
//  Created by Shubham on 08/12/20.
//

import SwiftUI

struct CupView: View {
    
    // MARK:- variables
    let animationDuration: TimeInterval = 0.75
    let outlineColor: Color = Color(hex:"155498")
    
    var width: CGFloat = 300
    var height: CGFloat = 400
    
    var curveHeight: CGFloat = 5
    var curveLength: CGFloat = 7
    
    @State var strokeEnd: CGFloat = 0
    @State var time: Double = 0
    @State var yOffset: CGFloat = UIScreen.main.bounds.height / 2
    
    @State var showLogo: Bool = false
    @State var isAnimating: Bool = false
    
    // MARK:- views
    var body: some View {
        ZStack {
            MediumCupShape()
                .trim(from: 0, to: strokeEnd)
                .stroke(style: StrokeStyle(lineWidth: 3))
            ZStack {
                Wave(time: CGFloat(time * 1.2), width: width, height: height, curveHeight: curveHeight, curveLength: curveLength)
                    .fill(outlineColor)
                    .offset(y: self.isAnimating ? -100 : self.yOffset)
                Wave(time: CGFloat(time), width: width, height: height, curveHeight: curveHeight, curveLength: curveLength)
                    .fill(outlineColor)
                    .opacity(0.5)
                    .offset(y: self.isAnimating ? -100 : self.yOffset)
            }.mask(MediumCupShape())
            CapView()
            GeometryReader { geo in
                let cX = geo.size.width / 2 + 6
                let cY = geo.size.height / 2 - 12
                Path({path in
                    path.move(to: CGPoint(x: cX - 48, y: cY + 102))
                    path.addLine(to: CGPoint(x: cX + 68, y: cY + 102))
                }).trim(from: 0, to: strokeEnd)
                .stroke(style: StrokeStyle(lineWidth: 4))
                .foregroundColor(Color.black.opacity(0.6))
                .animation(.default)
            }.shadow(radius: 5)
            Image("pepsi")
                .resizable()
                .frame(width: 78, height: 78)
                .shadow(radius: 4)
                .overlay(Circle()
                            .stroke(style: StrokeStyle(lineWidth: 3))
                            .foregroundColor(.white)
                            .scaleEffect(0.9)
                ).offset(y: -6)
                .opacity(self.showLogo ? 1 : 0)
                .animation(.default)
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                
                withAnimation(Animation.easeOut(duration: 1)) {
                    strokeEnd = 1
                }
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    self.time += 0.01
                }
                Timer.scheduledTimer(withTimeInterval: animationDuration * 3, repeats: false) { _ in
                    withAnimation(Animation.easeOut(duration: 1.5)) {
                        self.isAnimating.toggle()
                    }
                }
                Timer.scheduledTimer(withTimeInterval: animationDuration * 3.8, repeats: false) { _ in
                    self.showLogo.toggle()
                }
            }
            }
        .scaleEffect(1.25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CupView()
            Text("@Shubham_iosdev")
                .opacity(0.8)
                .font(.system(size: 20, weight: .medium, design: .monospaced))
                .offset(y: 300)
        }    }
}
