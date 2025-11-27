//
//  ReservationForm.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct ReservationForm: View {
    // constants
    let appName = "Habit Loop"
    let maxFrequency = 7
    let maxSubtasks = 4
    
    // state variable - if the value changes, the view updates
    @State private var userName = ""
    @State private var habitFrequency = 1
    @State private var phoneNumber = ""
    @State private var previewText = ""
    @State private var numberSubtasks = 0
    @State private var taskCategory = ""
    @State private var isDailyGoal = false
    @State private var isSubtaskActive = false
    
    // 1) labels for frequency
    func frequencyLabel(_ count: Int) -> String {
        count == 1 ? "Time" : "Times"
    }
    
    // 2) price estimation
    func estimateComplexity(baseScore: Double, subtaskScore: Double) -> Double {
        /*
        adult is 10
        child is 5.0
         
         1. create the constant
         2. add the param
         3. do calculation
         */
        let baseComplexity = Double(habitFrequency) * 10.0
        let subtaskComplexity = Double(numberSubtasks) * 5.0
        let total = baseComplexity + subtaskComplexity
        
        if numberSubtasks == 0 {
            return baseComplexity
        } else {
            return total
        }
    }

    var body: some View {
        // header
        Section{
            HStack {
                Image(systemName: "brain.head.profile")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .font(.system(size: 20))
                
                Text(appName)
                    .font(.title3)
                    .bold()
            }
        }
        
        Form{
            // reservation details
            Section(header: Text("Habit Setup Details")){
                TextField("Name", text: $userName)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                
                if userName.isEmpty {
                    Text("Please enter a name.")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                TextField("Category (Work, Health, Personal, etc): ", text: $taskCategory)
                
                // outdoor seating toggle
                Toggle("Set as a daily goal?", isOn: $isDailyGoal)

                // use a constant
                Stepper("Frequency: \(habitFrequency)", value: $habitFrequency, in: 1...maxFrequency)
                
                if habitFrequency >= 6 {
                    Text("High Frequency")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                
                // if yes children, show stepper
                Toggle("Add substasks?", isOn: $isSubtaskActive)
                
                if isSubtaskActive == true {
                    Stepper("Subtasks: \(numberSubtasks)", value: $numberSubtasks, in: 0...maxSubtasks)
                }
                
                // phone number
                Section(header: Text("Account Information")) {
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
                Button("Preview Task Setup"){
                    previewText =
                    """
                    Name: \(userName)
                    Category: \(taskCategory)
                    Daily Goal: \(isDailyGoal)
                    \(frequencyLabel(habitFrequency)): \(habitFrequency)
                    Subtaks: \(numberSubtasks)
                    Phone: \(phoneNumber)
                    """
                }
                // show preview text
                Section(){
                    Text(previewText)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }


            
            // summary
            Section(header: Text("Complexity Summary")) {
                VStack(){
                    
                    HStack(){
                        Text("Task Summary")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "pencil.and.list.clipboard")
                    } .padding(.bottom, 15)
                        .foregroundColor(.brown)
                    HStack(){
                        Text("Name: ")
                        Spacer()
                        Text("\(userName)")
                            .foregroundColor(.secondary)
                    }
                    HStack(){
                        Text("Frequency: ")
                        Spacer()
                        Text("\(habitFrequency)")
                            .foregroundColor(.secondary)
                    }
                    HStack(){
                        Text("Subtasks: ")
                        Spacer()
                        Text("\(numberSubtasks)")
                            .foregroundColor(.secondary)
                    }
                    HStack(){
                        Text("Estimated Complexity Score: ")
                        Spacer()
                        Text("\(estimateComplexity(baseScore: 10.0, subtaskScore: 5.0), specifier:("%.1f"))")
                            .foregroundColor(.secondary)
                    }
                
                } .padding()
            }
        }
    }
}

#Preview {
    ReservationForm()
}
