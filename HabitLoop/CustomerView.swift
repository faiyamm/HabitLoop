//
//  CustomerView.swift
//  HabitLoop
//
//  Created by Fai on 03/12/25.
//

import SwiftUI

struct CustomerView: View {
    // creating the obj
    var customer: [Customer] = [
        Customer(name: "Daily Reading", email: "fai@icloud.com", visits: 15, isLoyaltyMember: true),
        Customer(name: "Morning Walk", email: "juan@yahoo.com", visits: 2, isLoyaltyMember: false),
        Customer(name: "Code Review", email: "mike@gmail.com", visits: 8, isLoyaltyMember: true),
        Customer(name: "Budget Tracking", email: "sam@gmail.com", visits: 6, isLoyaltyMember: true),
        Customer(name: "Language Practice", email: "karen@outlook.com", visits: 1, isLoyaltyMember: false)
    ]
    
    var body: some View {
        List {
            Text("Habits Records Summary")
                .font(.largeTitle)
                .padding()
            ForEach(customer) { customer in
                VStack(alignment: .leading) {
                    HStack {
                        Text(customer.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        if customer.isLoyaltyMember {
                            Image(systemName: "flag.fill")
                                .foregroundColor(.orange)
                                .font(.caption)
                                .padding(4)
                        }
                    }
                    
                    Text(customer.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Completions: \(customer.visits)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("All Habit Records")
    }
}

#Preview {
    CustomerView()
}
