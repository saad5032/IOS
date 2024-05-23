//
//  MultiDatePickerView.swift
//  Pickers
//
//  Created by Kurt McMahon on 10/4/22.
//

import SwiftUI

struct MultiDatePickerView: View {
    
    //set is data type which contains unordered list of items.The state variable for selected dateds by picker has to be set.
    
    @State private var selectedDates: Set<DateComponents> = []
    @State private var formattedDates: String = ""
    
    let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            Text("Choose your Travel Dates")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()

            MultiDatePicker("Travel Dates", selection: $selectedDates)
            // Bascically this multidatepicker is giving a view like calender which allows me to select from month 1st to last date. I can set the range of the selection by the way. What ever I selected is stored in set component.
            
                .frame(height: 300)
            
            // As i select 1st,2nd,3rd .. dates, on every selection changes the function formatSelectedDates() is called.
                .onChange(of: selectedDates, perform: { _ in
                    formatSelectedDates()
                })
            
            Text("Your travel dates:")
                .bold()
            
            ScrollView {
                LazyVStack {
                    Text(formattedDates)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
    
    
    private func formatSelectedDates() {
        formatter.dateFormat = "MMM-dd-YY"
        // date is iterating through the set component(selectedDates) and turn the elements (elements are stored in set via $selectedDates --> multidate picker) of the set  to an actual date via calender method. Finally store the result in dates.
        
        let dates = selectedDates.compactMap { date in
                Calendar.current.date(from: date)
            }
        
        // formatter.dateFormat = "MMM-dd-YY" formatting of the dates of set are done according to this way. and the result is stored as an array of big string
        
            .map { date in
                formatter.string(from: date)
            }.sorted()
        
        // im making parts of tge strings and throwing new string to next line
        
        formattedDates = dates.joined(separator: "\n")
        
        // i am displaying this dates in a laszVstack view which is above.
    }
}

struct MultiDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerView()
    }
}
