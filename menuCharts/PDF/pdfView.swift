//
//  pdfView.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI

struct pdfView: View {
    
    @StateObject var downloadModel = DownloadTaskModel()
    @State var urlPDF = "https://sodic.sycec.mx/PDF/Aplicaci%C3%B3n_Seguimiento_Remoto_Sin_Video_27022021.pdf"
    
    var body: some View {
        NavigationView{
            SwiftUIWebView(url: URL(string: urlPDF))
                .navigationTitle("Sodic")
                .navigationBarItems(trailing:
                                        Button(action: {downloadModel.startDownload(urlString: urlPDF)}, label: {
                                            Image(systemName: "square.and.arrow.down")
                                        })
                )
        }
        .alert(isPresented: $downloadModel.showAlert, content: {
            Alert(title: Text("Mensaje"), message: Text(downloadModel.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                
            }))
        })
        .overlay(
            ZStack{
                if downloadModel.showDownloadProgress{
                    DownloadProgressView(progress: $downloadModel.downloadProgress)
                        .environmentObject(downloadModel)
                }
            }
        )
    }
}

struct pdfView_Previews: PreviewProvider {
    static var previews: some View {
        pdfView()
    }
}
