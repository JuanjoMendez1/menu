//
//  pdfView.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI

struct pdfView: View {
    var body: some View {
        NavigationView{
            SwiftUIWebView(url: URL(string: "https://sodic.sycec.mx/PDF/Aplicaci%C3%B3n_Seguimiento_Remoto_Sin_Video_27022021.pdf"))
                .navigationTitle("Sodic")
        }
    }
}

struct pdfView_Previews: PreviewProvider {
    static var previews: some View {
        pdfView()
    }
}
