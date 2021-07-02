//
//  DownloadProgressView.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI

struct DownloadProgressView: View {
    
    @Binding var progress: CGFloat
    @EnvironmentObject var downloadModel: DownloadTaskModel
    
    var body: some View {
        ZStack{
            Color.primary
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 15){
                ZStack{
//                    Personalizando vista de progress
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                    ProgressShape(progress: progress)
                        .fill(Color.gray.opacity(0.4))
                        .rotationEffect(.init(degrees: -90))
                }
                .frame(width: 70, height: 70)
                
//                Boton de cancelar
                Button(action: downloadModel.cancelTask, label: {
                    Text("Cancelar")
                        .fontWeight(.semibold)
                })
                .padding(.top)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 50)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}



//Personalizando circulo de progreso

struct ProgressShape: Shape{
    
    var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 35, startAngle: .zero, endAngle: .init(degrees: Double(progress * 360)), clockwise: false)
        }
    }
}
