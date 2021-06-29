//
//  SideMenu.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 28/06/21.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
//                Padding top for top close button
                .padding(.top, 50)
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Juan José Méndez")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            })
            
//                Tab Buttons

                VStack(spacing: 10){
                    TabButton(image: "line.diagonal", title: "Grafica Lineal", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "line.diagonal.arrow", title: "Grafica Lineal 2", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "chart.bar", title: "Grafica de Barras", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "chart.pie", title: "Grafica de Pastel", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "map", title: "Mapas", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "doc", title: "Documentos", selectedTab: $selectedTab, animation: animation)
                    TabButton(image: "camera", title: "Camaras", selectedTab: $selectedTab, animation: animation)
                }
                .padding(.leading, -15)
                .padding(.top, 50)
            
            Spacer()
            
//                Sing Out Button
            VStack(alignment: .leading, spacing: 6, content: {
                
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Salir", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
                
                Text("Version 1.0.0")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
            })
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
