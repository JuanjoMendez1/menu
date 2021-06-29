//
//  CustomCorners.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 28/06/21.
//

import SwiftUI


struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
        
    }
}
