//
//  DownloadTaskModel.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI

class DownloadTaskModel: NSObject,ObservableObject,URLSessionDownloadDelegate,UIDocumentInteractionControllerDelegate {
    
    @Published var downloadURL: URL!
    
//    Alert
    @Published var alertMsg = ""
    @Published var showAlert = false
    
//    Guardando datos de descarga
    @Published var downloadtaskSession: URLSessionDownloadTask!
    
//    Progress
    @Published var downloadProgress: CGFloat = 0
    
//    Show Progress
    @Published var showDownloadProgress = false
    
//    Funcion de descarga
    func startDownload(urlString: String){
        guard let ValidURL = URL(string: urlString) else{
            self.reportError(error: "URL invalida")
            return
        }
        
//        Previniendo descargar el mismo archivo
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        if FileManager.default.fileExists(atPath: directoryPath.appendingPathComponent(ValidURL.lastPathComponent).path){
            print("Archivo Encontrado")
            let controller = UIDocumentInteractionController(url: directoryPath.appendingPathComponent(ValidURL.lastPathComponent))
            controller.delegate = self
            controller.presentPreview(animated: true)
        } else{
            print("Archivo No Encontraco")
//        validando URL
        downloadProgress = 0
        withAnimation{showDownloadProgress = true}
        
//        Descarga task
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        downloadtaskSession = session.downloadTask(with: ValidURL)
        downloadtaskSession.resume()
        }
        
    }
    
    func reportError(error: String) {
        alertMsg = error
        showAlert.toggle()
    }
    
//    Implementando funcio es de URL Sesion
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = downloadTask.originalRequest?.url else {
            DispatchQueue.main.async {
                self.reportError(error: "Hay algunos problemas, intentalo más tarde.")
            }
            return
        }
        
//        Directory path
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
//        Creando una carpeta para el archivo
//        Destination URL
//        getting like ijustin.mp4
        let destinationURL = directoryPath.appendingPathComponent(url.lastPathComponent)
        
//        if already file is there removing that
        try? FileManager.default.removeItem(at: destinationURL)
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
//            if succes
            print("succes")
//            clossing progress view
            DispatchQueue.main.async {
                withAnimation{self.showDownloadProgress = false}
                
//                Presentando el archivo con ayuda de la interaccion de UIKIT
                let controller = UIDocumentInteractionController(url: destinationURL)
                controller.delegate = self
                controller.presentPreview(animated: true)
            }
        } catch {
            DispatchQueue.main.async {
                self.reportError(error: "Intentalo mas tarde")
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        obteniendo el proceso
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
//        Since url session will be running in BG Thread
        DispatchQueue.main.async {
            self.downloadProgress = progress
        }
    }
    
//    error
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        DispatchQueue.main.async {
            if let error = error{
                withAnimation{self.showDownloadProgress = false}
                self.reportError(error: error.localizedDescription)
                return
            }
        }
    }
    
//    Cancel task
    func cancelTask() {
        if let task = downloadtaskSession,task.state == .running{
//            Cancelar
            downloadtaskSession.cancel()
//            Cerrando vista
            withAnimation{self.showDownloadProgress = false}
        }
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }
}
