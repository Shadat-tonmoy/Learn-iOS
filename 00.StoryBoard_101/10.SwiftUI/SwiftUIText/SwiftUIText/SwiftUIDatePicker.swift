//
//  SwiftUIDatePicker.swift
//  SwiftUIText
//
//  Created by Tonmoy on 29/3/23.
//

import SwiftUI

struct SwiftUIDatePicker: View {
    @State var selectedDate : Date = Date()
    var startingDate : Date = Calendar.current.date(from: DateComponents(year: 2014)) ?? Date()
    var endingDate : Date = Date()
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Selected Date \n\(dateFormatter.string(from: selectedDate)), in ms : \(selectedDate.timeIntervalSince1970)")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                
                DatePicker("Select a date",
                           selection: $selectedDate,
                           in: startingDate...endingDate,
                           displayedComponents: [.date, .hourAndMinute])
                    .accentColor(.purple)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        
                    )
                    .padding()
                    .foregroundColor(.purple)
                .datePickerStyle(DefaultDatePickerStyle())
            }
            
        }
    }
}

struct SwiftUIDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDatePicker()
    }
}
