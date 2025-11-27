//
//  MenuView.swift
//  HabitLoop
//
//  Created by Fai on 26/11/25.
//

import SwiftUI

struct MenuView: View {
    // dictionary
    let menuItems = [
        // key:value
        "Cheese Pizza": 12.99,
        "Pepperoni Pizza": 14.99,
        "BBQ Chicken Pizza": 16.99,
        "Spaghetti": 8.99
    ]
    
    func getTotalItems() -> Int{
        menuItems.count
    }
    
    func highestPrice() -> Double{
        menuItems.values.max() ?? 0.0
    }
    
    func lowestPrice() -> Double{
        menuItems.values.min() ?? 0.0
    }

    
    var body: some View {
        
        // 1. convert dictionary into a sorted array
        let sortedMenu = menuItems.sorted { $0.value < $1.value }
        
        VStack{
            HStack {
                Image(systemName: "fork.knife.circle")
                    .imageScale(.large)
                    .foregroundColor(.orange)
                    .font(.system(size: 30))
                
                Text("Habit Loop")
                    .font(.title3)
                    .bold()
            }
            List {
                ForEach(sortedMenu, id: \.key){ name, price in
                    /*Text(name)
                    Text("$\(price, specifier: "%.2f")")*/
                    HStack{
                        Text(name)
                        Spacer()
                        Text("$\(price, specifier: "%.2f")")
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
            }
            
            Section {
                VStack {
                    HStack {
                        Text("Total Items:")
                        Spacer()
                        Text("\(getTotalItems())")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Highest Price:")
                        Spacer()
                        Text("$\(highestPrice(), specifier: "%.2f")")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Lowest Price:")
                        Spacer()
                        Text("$\(lowestPrice(), specifier: "%.2f")")
                            .foregroundColor(.secondary)
                    }
                }
            } .padding()
        }
    }
}

#Preview {
    MenuView()
}
