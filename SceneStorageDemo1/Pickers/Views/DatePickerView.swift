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
        formatter.dateStyle = .none
        formatter.timeStyle = .short
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
                .datePickerStyle(WheelDatePickerStyle())
        
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
