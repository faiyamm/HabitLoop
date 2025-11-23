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
    @State private var isOutdoorSeating = false

    var body: some View {
        // header
        Section{
            HStack {
                Image(systemName: "fork.knife.circle")
                    .imageScale(.large)
                    .foregroundColor(.orange)
                    .font(.system(size: 30))
                
                Text(restaurantName)
                    .font(.title3)
                    .bold()
            }
        }
        
        Form{
            // reservation details
            Section(header: Text("Reservation Details")){
                TextField("Name", text: $userName)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                
                if userName.isEmpty {
                    Text("Please enter a name.")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                TextField("Occasion (Birthday, Anniversary, etc.): ", text: $occasion)
                
                // outdoor seating toggle
                Toggle("Is this a outdoor seating?", isOn: $isOutdoorSeating)

                // use a constant
                Stepper("Guest: \(guestCount)", value: $guestCount, in: 1...maxGuest)
                
                if guestCount >= 6 {
                    Text("Large group — please call ahead")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                Stepper("Children: \(numberChildren)", value: $numberChildren, in: 0...maxChildren)
                
                
                // phone number
                Section(header: Text("Contact Information")) {
                    TextField("Phone", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                
                if phoneNumber.isEmpty {
                    Text("Please enter your phone number.")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }

            // preview confirmation
            Section {
                Button("Preview Reservation"){
                    previewText =
                    """
                    Name: \(userName)
                    Occasion: \(occasion)
                    Outdoor seating: \(isOutdoorSeating)
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
