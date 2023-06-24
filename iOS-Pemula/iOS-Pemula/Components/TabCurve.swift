//
//  TabCurve.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 23/06/23.
//

import SwiftUI

struct TabCurve: Shape {

    func path(in rect:CGRect) -> Path{
        return Path{ path in
            //curving the path
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = rect.width / 2
            
            path.move(to: CGPoint(x: mid - 40 , y: rect.height))
            
            let to = CGPoint (x: mid, y: rect.height - 20)
            let contor11 = CGPoint(x: mid - 15, y: rect.height)
            let control2 = CGPoint(x: mid - 15, y: rect.height -
            20)
            let to1 = CGPoint (x: mid + 40, y: rect.height)
            let contor13 = CGPoint(x: mid + 15, y: rect.height -
            20)
            let control4 = CGPoint(x: mid + 15, y: rect.height)
            path.addCurve(to: to, control1: contor11, control2:
            control2)
            path.addCurve(to: to1, control1: contor13, control2:
            control4)
        }
    }
}

struct Preview_TabCurve:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

