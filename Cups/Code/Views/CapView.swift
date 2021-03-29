//
//  CapView.swift
//  Cups
//
//  Created by Shubham on 17/02/21.
//

import SwiftUI

struct CapView: View {
    
    // MARK:- variables
    let lineWidth: CGFloat = 4
    let cXPos: CGFloat = 6
    let cYPos: CGFloat = -43
    
    let animationDuration: TimeInterval = 0.6
    
    @State var lowerCapEnd: CGFloat = 1
    @State var upperCapEnd: CGFloat = 1
    @State var strawEnd: CGFloat = 1
    
    @State var lowerCapFill = false
    @State var upperCapFill = false
    @State var strawFill = false
    
    // MARK:- views
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let cX = geo.size.width / 2 + cXPos
                let cY = geo.size.height / 2 + cYPos
                                
                Path({path in
                    path.move(to: CGPoint(x: cX + 48, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 60, y: cY - 42))
                    path.addLine(to: CGPoint(x: cX + 58, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 72, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 76, y: cY - 42))
                    path.closeSubpath()
                })
                .foregroundColor(Color(hex: "fafafa"))
                
    
                Path({path in
                    path.move(to: CGPoint(x: cX - 64, y: cY - 56))
                    path.addLine(to: CGPoint(x: cX - 62, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 46, y: cY - 70))
                    path.addLine(to: CGPoint(x: cX + 48, y: cY - 56))
                })
                .foregroundColor(Color(hex: "fafafa"))

                Path({path in
                    path.move(to: CGPoint(x: cX + 6, y: cY - 70))
                    path.addLine(to:    CGPoint(x: cX + 10, y: cY - 96))
                    path.addLine(to: CGPoint(x: cX + 28, y: cY - 103))
                    path.addLine(to: CGPoint(x: cX + 30, y: cY - 97))
                    path.addLine(to: CGPoint(x: cX + 16, y: cY - 92))
                    path.addLine(to: CGPoint(x: cX + 13, y: cY - 70))
                })
                .foregroundColor(Color(hex: "fafafa"))
            }
        }
    }
}

struct CapView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "")
                .edgesIgnoringSafeArea(.all)
            CapView()
            Text("@Shubham_iosdev")
                .opacity(0.8)
                .font(.system(size: 20, weight: .medium, design: .monospaced))
                .offset(x: 90, y: 400)
        }
    }
}
