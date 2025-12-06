//
//  MenuView.swift
//  HabitLoop
//
//  Created by Fai on 26/11/25.
//

import SwiftUI

struct MenuView: View {
    // variable and constants
    @State private var showDesserts = false
    @State private var filterSelector: String = "All"
    
    let filterCategories: [String] = ["All", "Low", "High"]
    
    // dictionary
    let menuItems = [
        // key:value
        "Daily Standup": 12.99,
        "30 Min Cardio": 19.99,
        "Read 1 Chapter": 9.99,
        "Budget Review": 8.99,
        "Water Tracking": 12.99,
        "Learning Swift": 15.99
    ]
    
    // computed property #1
    
    /* syntax:
     var propertyName: Type {
        return a calculated value
     }
     */
    
    var sortedMenu: [(name: String, price: Double)] {
        menuItems
            .sorted { $0.key < $1.key } // array of key, value
            .map{ (name: $0.key, price: $0.value) } // rename key, value to name, price
    }
    
    // computed property #2
    var displayMenu: [(name: String, price: Double)] {
        var sortedList = sortedMenu
        
        if filterSelector == "Low" {
            sortedList = sortedList.filter { $0.price < 10.0 }
        }
        
        if filterSelector == "High" {
            sortedList = sortedList.filter { $0.price > 10.0 }
        }
        
        return sortedList
    }
    
    // computed property #3
    var averagePrice: Double {
        let prices = menuItems.values
        let total = prices.reduce(0, +)
        return total / Double(prices.count)
    }
    
    // count premium items
    var premiumItemCount: Int {
        return displayMenu.filter { $0.price >= 10.0 }.count
    }
    
    // count regular items
    var regularItemCount: Int {
        return displayMenu.filter { $0.price < 10.0 }.count
    }
    
    // calc total price
    var totalScore: Double {
        return displayMenu.reduce(0.0) { total, item in
            total + item.price
        }
    }
    
    // functions
    func getTotalItems() -> Int{
        displayMenu.count
    }
    
    func highestPrice() -> Double{
        // menuItems.values.max() ?? 0.0
        var highest = 0.0
        for item in displayMenu {
            if item.price > highest {
                highest = item.price
            }
        }
        return highest
    }
    
    // mini challenge
    func lowestPrice() -> Double{
        // menuItems.values.min() ?? 0.0
        var lowest = 9999.99
        for item in displayMenu {
            if item.price < lowest {
                lowest = item.price
            }
        }
        return lowest
    }

    var body: some View {
        // 1. convert dictionary into a sorted array
        // let sortedMenu = menuItems.sorted { $0.value < $1.value
        HStack {
            ZStack {
                HStack {
                    Text(filterSelector)
                        .foregroundColor(.white)
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)

                Picker(selection: $filterSelector) {
                    ForEach(filterCategories, id: \.self) { category in
                        Text(category)
                    }
                } label: {
                    Text("Filter Tasks")
                }
                .pickerStyle(.menu)
                .frame(maxWidth: .infinity)
                .opacity(0.1)
            }
            .fixedSize(horizontal: true, vertical: false)

            Button("View SubTasks") {
                showDesserts = true
                print(showDesserts)
            }

            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .sheet(isPresented: $showDesserts) {
                DessertView()
            }
        } .padding(.horizontal)
        
        
        List {
            Section(header: Text("Showing \(displayMenu.count) Tasks")) {
                ForEach(displayMenu, id: \.name){ item in
                    MenuItemRowView(name: item.name, price: item.price)
                }
            }
        }
        
        Section {
            VStack {
                HStack {
                    Text("High Score Tasks:")
                    Spacer()
                    Text("\(premiumItemCount)")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Low Score Tasks:")
                    Spacer()
                    Text("\(regularItemCount)")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Total Composite Score:")
                    Spacer()
                    Text("\(totalScore, specifier:"%.2f")")
                        .foregroundColor(.secondary)
                }
            }
        } .padding()
        .navigationBarTitle("Task Analytics")
    }
}

#Preview {
    MenuView()
}
