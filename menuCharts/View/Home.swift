//
//  Home.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 28/06/21.
//

import SwiftUI

struct Home: View {
    
    @Binding var selectedTab: String
//    Hidin Tab Bar
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            
            BarChart()
                .tag("Grafica de Barras")
            GraficadePastel()
                .tag("Grafica de Pastel")
            Mapas()
                .tag("Mapas")
            pdfView()
                .tag("Documentos")
            CameraView()
                .tag("Camaras")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Todas las sub-vistas

struct GraficaLineal: View {
    
var body: some View{
        NavigationView{
            Text("Grafica Lineal")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Grafica Lineal")
        }
    }
}

struct GraficaLineal2: View {
    
    var body: some View{
        NavigationView{
            Text("Grafica Lineal 2")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Grafica Lineal 2")
        }
    }
}

struct GraficadeBarras: View {
    
    var body: some View{
        NavigationView{
            Text("Grafica de Barras")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Grafica de Barras")
        }
    }
}

struct GraficadePastel: View {
    
    var body: some View{
        NavigationView{
            Text("Grafica de Pastel")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Grafica de Pastel")
        }
    }
}

struct Mapas: View {
    
    var body: some View{
        NavigationView{
            Text("Mapas")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Mapas")
        }
    }
}

struct Documentos: View {
    
    var body: some View{
        NavigationView{
            Text("Documentos")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Documentos")
        }
    }
}

struct Camaras: View {
    
    var body: some View{
        NavigationView{
            Text("Camaras")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Camaras")
        }
    }
}
