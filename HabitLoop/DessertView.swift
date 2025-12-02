//
//  DessertView.swift
//  HabitLoop
//
//  Created by Fai on 29/11/25.
//

import SwiftUI

struct DessertView: View {
    
    // create the dictionary
    let dessertItems = [
        "Ice cream":3.00,
        "Brownies":4.10,
        "Gelato":3.80,
        "Tiramisu":4.50,
        "Fruit Salad":2.00
    ]
    
    var body: some View {
        
        Text("Dessert Menu")
            .font(.largeTitle)
            .padding()
        
        List {
            ForEach(dessertItems.sorted { $0.value < $1.value }, id: \.key ) { name, price in
                HStack {
                    Text(name)
                    Spacer()
                    Text("$\(price, specifier: "%.2f")")
                }
            }
        }
    }
}

#Preview {
    DessertView()
}
