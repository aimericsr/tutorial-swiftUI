//
//  DateScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 13/05/2022.
//

import SwiftUI

struct DateScreen: View {
    private var dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let minAgeDate = calendar.date(byAdding: .year, value: -120, to: .now)
        let maxAgeDate = calendar.date(byAdding: .year, value: -18, to: .now)
        
        return minAgeDate!...maxAgeDate!
    }()
    
    
    @State private var selectedDate: Date = .now
    var body: some View {
        VStack {
            Text(selectedDate, style: .date)
                .padding()
            DatePicker(
                selection: $selectedDate,
                in: dateRange,
                displayedComponents: [.date]){
                    Label("Select a date", systemImage: "calendar")
                }
            .padding()
            
            DatePicker(
                selection: $selectedDate,
                in: dateRange,
                displayedComponents: [.date]){
                    Label("Select a date", systemImage: "calendar")
                }
                .padding()
                .labelsHidden()
                .datePickerStyle(.wheel)
        }
    }
}

struct DateScreen_Previews: PreviewProvider {
    static var previews: some View {
        DateScreen()
    }
}
