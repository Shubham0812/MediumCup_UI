//
//  MediumCupShape.swift
//  Cups
//
//  Created by Shubham on 08/12/20.
//

import SwiftUI

struct MediumCupShape: Shape {
 
    // MARK:- functions
    func path(in rect: CGRect) -> Path {
        let cX = rect.midX + 6
        let cY = rect.midY - 12
        
        var path = Path()
        
        path.move(to: CGPoint(x: cX - 60, y: cY - 84))
        path.addLine(to: CGPoint(x: cX - 48, y: cY + 94))
        
        path.addQuadCurve(to: CGPoint(x: cX - 33, y: cY + 100), control: CGPoint(x: cX - 45, y: cY + 100))
        path.addLine(to: CGPoint(x: cX, y: cY + 100))
        
        path.addQuadCurve(to: CGPoint(x: cX + 33, y: cY + 94), control: CGPoint(x: cX + 33, y: cY + 100))
        path.addLine(to: CGPoint(x: cX + 48, y: cY - 84))
        path.closeSubpath()
        
        return path
    }
    
}

struct MediumCupShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        MediumCupShape()
            .stroke(style: StrokeStyle(lineWidth: 4))
            Text("@Shubham_iosdev")
                .opacity(0.8)
                .font(.system(size: 20, weight: .medium, design: .monospaced))
                .offset(y: 300)
        }
    }
}
