//
//  TransactionBarChartView.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import Charts
import SwiftUI

struct TransactionBarChartView: UIViewRepresentable{
    
    let entries: [BarChartDataEntry]
    let barChart = BarChartView()
    @Binding var selectedYear: Int
    @Binding var selectedItem: String
    
    func makeUIView(context: Context) -> BarChartView {
        barChart.delegate = context.coordinator
        return barChart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.label = "Información"
        uiView.noDataText = "No hay información"
        uiView.data = BarChartData(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        if uiView.scaleX == 1.0{
            uiView.zoom(scaleX: 1.5, scaleY: 1, x: 0 ,y: 0)
        }
        uiView.data = BarChartData(dataSet: dataSet)
        formDataSet(dataSet: dataSet)
        formaterLeftAxis(leftAxis: uiView.leftAxis)
        formatXAxis(xAxis: uiView.xAxis)
        formatLegend(legend: uiView.legend)
        uiView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        let parent: TransactionBarChartView
        init(parent: TransactionBarChartView){
            self.parent = parent
        }
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let month = Transaction.months[Int(entry.x)]
            let quantity = Int(entry.y)
            parent.selectedItem = "\(quantity) sold in \(month)"
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func formDataSet(dataSet: BarChartDataSet){
        dataSet.colors = [.red]
        dataSet.valueColors = [.red]
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
        
    }
    
    func formaterLeftAxis(leftAxis: YAxis){
        leftAxis.labelTextColor = .red
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
        
    }
    
    func formatXAxis(xAxis: XAxis){
        xAxis.valueFormatter = IndexAxisValueFormatter(values: Transaction.months)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .red
    }
    
    func formatLegend(legend: Legend){
        legend.textColor = .red
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.drawInside = true
        legend.yOffset = 30.0
    }
    
}

struct TansactionBarCharView_Previews: PreviewProvider{
    static var previews: some View{
        TransactionBarChartView(entries: Transaction.dataEntriesForYear(2019, transactions: Transaction.allTransactions), selectedYear: .constant(2019), selectedItem: .constant(""))
    }
}
