//
//  DessertView.swift
//  HabitLoop
//
//  Created by Fai on 29/11/25.
//

import SwiftUI

struct DessertView: View {
    
    // create the dictionary
    let subTaskItems = [
        "Plan Day": 3.0,
        "Stretch": 4.1,
        "Review Notes": 3.8,
        "Quick Clean": 4.5,
        "Hydrate": 2.0
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Text("Available Subtasks")
                    .font(.largeTitle)
                    .padding()
                    .multilineTextAlignment(.center)
                
                ForEach(subTaskItems.sorted { $0.value < $1.value }, id: \.key ) { name, score in
                    HStack {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("Score: \(score, specifier: "%.1f")")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    DessertView()
}
