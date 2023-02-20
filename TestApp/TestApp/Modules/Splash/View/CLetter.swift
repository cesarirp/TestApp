//
//  CLetter.swift
//  TestApp
//
//  Created by Andres Rodriguez on 20/02/23.
//

import SwiftUI

struct CLetter: Shape {
    private var innerMultiplier = Double.zero
    
    init(fill: Bool) {
        self.innerMultiplier = fill ? 0 : 0.5
    }
    
    var animatableData: Double {
        get { innerMultiplier }
        set { innerMultiplier = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let corner = CGFloat(10)
        let space = CGFloat(5)
        let innerSpace = CGFloat(rect.width*innerMultiplier)
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX-corner, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX+corner, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY+corner),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-corner))
        path.addQuadCurve(to: CGPoint(x: rect.minX+corner, y: rect.maxY),
                          control: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX-corner, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY-corner),
                          control: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY+space/2))
        path.addLine(to: CGPoint(x: rect.maxX-innerSpace, y: rect.midY+space/2))
        path.addLine(to: CGPoint(x: rect.maxX-innerSpace, y: rect.midY-space))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY-space))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+corner))
        path.addQuadCurve(to: CGPoint(x: rect.maxX-corner, y: rect.minY),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}
