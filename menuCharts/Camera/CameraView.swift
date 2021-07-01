//
//  CameraView.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        NavigationView{
            SwiftUIWebView(url: URL(string: "https://rtsp.me/embed/bABSsBEh/"))
                .navigationTitle("Camaras")
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
