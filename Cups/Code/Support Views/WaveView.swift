//
//  WaveView.swift
//  Cups
//
//  Created by Shubham on 08/12/20.
//

import SwiftUI

struct Wave: Shape {
    var time: CGFloat
    let width: CGFloat
    let height: CGFloat
    let curveHeight: CGFloat
    let curveLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return (
            Path { path in
                path.move(to: CGPoint(x: width, y: height*2))
                path.addLine(to: CGPoint(x: 0, y: height*2))
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                    path.addLine(to: CGPoint(x: i, y: sin(((i / rect.height) + time) * curveLength * .pi) * curveHeight + rect.midY))
                }
                path.addLine(to: CGPoint(x: width, y: height*2))
            }
        )
    }
}


struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        Wave(time: CGFloat(2*1.2), width: 423 + 10, height: 200, curveHeight: 10, curveLength: 20)
            .fill(Color.black)
    }
}
