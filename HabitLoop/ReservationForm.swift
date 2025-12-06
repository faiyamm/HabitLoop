//
//  ReservationForm.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct ReservationForm: View {
    // constants
    let appName = "Setup Details"
    let maxFrequency = 7
    let maxSubtasks = 4
    
    // state variable - if the value changes, the view updates
    @State private var habitName = ""
    @State private var habitFrequency = 1
    @State private var phoneNumber = ""
    @State private var previewText = ""
    @State private var numberSubtasks = 0
    @State private var taskCategory = ""
    @State private var isDailyGoal = false
    @State private var isSubtaskActive = false
    @State private var showWarning = false
    
    // 1) labels for frequency
    func frequencyLabel(_ count: Int) -> String {
        count == 1 ? "Time" : "Times"
    }
    
    // 2) complexity estimation
    func estimateComplexity(baseScore: Double, subtaskScore: Double) -> Double {
        /*
         baseScore is 10.0
         subtaskScore is 5.0
         
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
        
        Form{
            // setup details
            Section(header: Text("Task Setup")){
                TextField("Enter Habit Name", text: $habitName)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                .onChange(of: habitName) {
                    if (habitName.isEmpty) {
                        if !showWarning {
                            showWarning = true
                        }
                    }
                }
                
                if habitName.isEmpty && showWarning {
                    Text("Please enter a habit name")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                TextField("Category (Work, Health, Personal, etc.): ", text: $taskCategory)
                
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
            }

            // preview confirmation
            Section {
                Button("Preview Task Setup"){
                    previewText =
                    """
                    Name: \(habitName)
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
                        Image(systemName: "chart.line.uptrend.xyaxis")
                    }
                    .padding(.bottom, 15)
                    .foregroundColor(.brown)
                    
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
        } .navigationBarTitle("Set Up New Habit")
    }
}

#Preview {
    ReservationForm()
}
