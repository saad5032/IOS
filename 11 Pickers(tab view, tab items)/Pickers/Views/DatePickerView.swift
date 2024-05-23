//
//  DatePickerView.swift
//  Pickers
//
//  Created by Kurt McMahon on 2/24/22.
//

import SwiftUI

struct DatePickerView: View {
    
    @State private var selected = Date()
    @State private var showAlert = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        // if i select .full, .long , short i will get that much info when i select the date as an alert becoz i defined dateformatter in alert function to show msg
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Choose a Date")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            DatePicker("Date", selection: $selected, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.wheel)
                // if I dont want label not to be shown then
                .labelsHidden()
        
            Button("Select") {
                showAlert = true
            }
            .padding()
        
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Date and Time Selected"), message: Text("The date and time you have selected is \(dateFormatter.string(from: selected))"))
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
