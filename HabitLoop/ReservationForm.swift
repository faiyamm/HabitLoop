//
//  ReservationForm.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct ReservationForm: View {
    // constants
    let restaurantName = "Gourmet Haven"
    let maxGuest = 10
    let maxChildren = 4
    
    // state variable - if the value changes, the view updates
    @State private var userName = ""
    @State private var guestCount = 1
    @State private var phoneNumber = ""
    @State private var previewText = ""
    @State private var numberChildren = 0
    @State private var occasion = ""

    var body: some View {
        Form{
            // header
            Section{
                Text(restaurantName)
                    .font(.title3)
                    .bold()
                
                Text("Reservation form")
                    .foregroundColor(.secondary)
            }

            // reservation details
            Section(header: Text("Reservation Details")){
                TextField("Name", text: $userName)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                
                TextField("Occasion (Birthday, Anniversary, etc.): ", text: $occasion)

                // use a constant
                Stepper("Guest: \(guestCount)", value: $guestCount, in: 1...maxGuest)
                
                Stepper("Children: \(numberChildren)", value: $numberChildren, in: 0...maxChildren)
            }

            // phone number
            Section(header: Text("Contact Information")) {
                TextField("Phone", text: $phoneNumber)
                    .keyboardType(.phonePad)
            }

            // preview confirmation
            Section {
                Button("Preview Reservation"){
                    previewText =
                    """
                    Name: \(userName)
                    Occasion: \(occasion)
                    Guests: \(guestCount)
                    Children: \(numberChildren)
                    Phone: \(phoneNumber)
                    """
                }
            }

            // show preview text
            Section(header: Text("Reservation Preview")){
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ReservationForm()
}
