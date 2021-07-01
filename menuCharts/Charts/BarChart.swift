//
//  BarChart.swift
//  menuCharts
//
//  Created by Juan Jose Mendez Rojas on 01/07/21.
//

import SwiftUI
import Charts

struct BarChart: View {
    @State private var selectedYear: Int = 2019
    @State private var barEntries: [BarChartDataEntry] = []
    @State private var selectedItem = ""
    var body: some View {
        VStack{
            Text("\(selectedYear)".replacingOccurrences(of: ",", with: ""))
                .font(.title2)
            Button("Cambiar el Año"){
                if selectedYear == 2019{
                    selectedYear = 2020
                } else {
                    selectedYear = 2019
                }
            }
            TransactionBarChartView(entries: Transaction.dataEntriesForYear(selectedYear, transactions: Transaction.allTransactions), selectedYear: $selectedYear, selectedItem: $selectedItem)
                .frame(height: 500)
            Text(selectedItem)
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
