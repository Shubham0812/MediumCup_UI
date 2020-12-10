//
//  CapView.swift
//  Cups
//
//  Created by Shubham on 08/12/20.
//

import SwiftUI

struct CapView: View {
    
    // MARK:- variables
    let lineWidth: CGFloat = 4
    let cXPos: CGFloat = 6
    let cYPos: CGFloat = -43
    
    let animationDuration: TimeInterval = 0.75
    
    @State var lowerCapEnd: CGFloat = 0
    @State var upperCapEnd: CGFloat = 0
    @State var strawEnd: CGFloat = 0
    
    @State var lowerCapFill: Bool = false
    @State var upperCapFill: Bool = false
    
    // MARK:- views
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let cX = geometry.size.width / 2 + cXPos
                let cY = geometry.size.height / 2 + cYPos
                
                Path({path in
                    path.move(to: CGPoint(x: cX + 48, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 60, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 58, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 74, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 76, y: cY - 42))
                    path.closeSubpath()
                }).fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color(hex: "bdbdbd")]), startPoint: .leading, endPoint: .trailing))
                .opacity(lowerCapFill ? 1 : 0)
                .animation(.default)
                
                Path({path in
                    path.move(to: CGPoint(x: cX - 64, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 62, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 46, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 48, y: cY - 56))
                }).fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color(hex: "bdbdbd")]), startPoint: .leading, endPoint: .trailing))
                .opacity(upperCapFill ? 1 : 0)
                .animation(.default)
                
                Path({path in
                    path.move(to: CGPoint(x: cX + 48, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 60, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 58, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 74, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 76, y: cY - 42))
                    path.closeSubpath()
                }).trim(from: 0, to: lowerCapEnd)
                .stroke(style: StrokeStyle(lineWidth: lineWidth))
                
                
                Path({path in
                    path.move(to: CGPoint(x: cX - 64, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 62, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 46, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 48, y: cY - 56))
                }).trim(from: 0, to: upperCapEnd)
                .stroke(style: StrokeStyle(lineWidth: lineWidth))
                
                Path({path in
                    path.move(to: CGPoint(x: cX + 6, y: cY - 70))
                    path.addLine(to:    CGPoint(x: cX + 10, y: cY - 96))
                    path.addLine(to: CGPoint(x: cX + 28, y: cY - 103))
                    path.addLine(to: CGPoint(x: cX + 30, y: cY - 97))
                    path.addLine(to: CGPoint(x: cX + 16, y: cY - 92))
                    path.addLine(to: CGPoint(x: cX + 13, y: cY - 70))
                }).fill(Color.white)
                
                Path({path in
                    path.move(to: CGPoint(x: cX + 6, y: cY - 70))
                    path.addLine(to:    CGPoint(x: cX + 10, y: cY - 96))
                    path.addLine(to: CGPoint(x: cX + 28, y: cY - 103))
                    path.addLine(to: CGPoint(x: cX + 30, y: cY - 97))
                    path.addLine(to: CGPoint(x: cX + 16, y: cY - 92))
                    path.addLine(to: CGPoint(x: cX + 13, y: cY - 70))
                }).trim(from: 0, to: strawEnd)
                .stroke(style: StrokeStyle(lineWidth: lineWidth))
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    
                    
                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                        lowerCapFill.toggle()
                        withAnimation(Animation.easeOut(duration: animationDuration)) {
                            lowerCapEnd = 1
                        }
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: animationDuration * 2.25, repeats: false) { _ in
                        withAnimation(Animation.easeOut(duration: animationDuration)) {
                            upperCapEnd = 1
                        }
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: animationDuration * 3.5, repeats: false) { _ in
                        upperCapFill.toggle()
                        withAnimation(Animation.easeOut(duration: animationDuration / 2)) {
                            strawEnd = 1
                        }
                    }
                }
            }
        }
    }
}

struct CapView_Previews: PreviewProvider {
    static var previews: some View {
        CapView()
    }
}
