//
//  MenuView.swift
//  HabitLoop
//
//  Created by Fai on 26/11/25.
//

import SwiftUI

struct MenuView: View {
    // variable and constants
    @State private var showMessage = false
    @State private var showAffordableOnly = false
    @State private var showDesserts = false
    @State private var showBadgeOnly = false
    
    // dictionary
    let menuItems = [
        // key:value
        "Cheese Pizza": 12.99,
        "Pepperoni Pizza": 9.99,
        "BBQ Chicken Pizza": 19.99,
        "Spaghetti": 8.99,
        "Lasagna": 12.99,
        // "Chicken Alfredo": 14.99,
        // "Beef Stroganoff": 16.99,
        "Margherita Pizza": 9.99,
        // "Veggie Pizza": 13.99,
        "Four Cheese Pizza": 15.99
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
        
        if showAffordableOnly {
            sortedList = sortedList.filter { $0.price < 10.0 }
        }
        
        if showBadgeOnly {
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
    var totaalPrice: Double {
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
        var lowest = 20.0
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
        VStack{
            HStack {
                Image(systemName: "fork.knife.circle")
                    .imageScale(.large)
                    .foregroundColor(.orange)
                    .font(.system(size: 30))
                
                Text("Habit Loop")
                    .foregroundColor(.black)
                    .font(.title2)
                    .bold()
            }
            
            VStack {
                // Toggle("Show welcome message", isOn: $showMessage)
                
                Toggle("Show only affordable items < $10.00", isOn: $showAffordableOnly)
                    
                Toggle("Show only premium dishes", isOn: $showBadgeOnly)
            } .padding(.horizontal)
            
            if showMessage {
                Text("Welcome to Habit loop!")
                    .font(Font.title.bold())
                    .foregroundStyle(Color.blue)
                    .padding()
            }
            
            Button("View Desserts") {
                showDesserts = true
                print(showDesserts)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .sheet(isPresented: $showDesserts) {
                // add the view
                DessertView()
            }
            
            List {
                ForEach(displayMenu, id: \.name){ item in
                    /*Text(name)
                    Text("$\(price, specifier: "%.2f")")*/
//                    HStack{
//                        Text(name)
//                        Spacer()
//                        Text("$\(price, specifier: "%.2f")")
//                            .foregroundColor(.secondary)
//                    }
//                    .padding(.vertical, 8)
                    MenuItemRowView(name: item.name, price: item.price)
                } 
            }
            
            Section {
                VStack {
//                    HStack {
//                        Text("Total Items:")
//                        Spacer()
//                        Text("\(getTotalItems())")
//                            .foregroundColor(.secondary)
//                    }
                    HStack {
                        Text("Premium Items:")
                        Spacer()
                        Text("\(premiumItemCount)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Regular Items:")
                        Spacer()
                        Text("\(regularItemCount)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Total Price:")
                        Spacer()
                        Text("$\(totaalPrice, specifier:"%.2f")")
                            .foregroundColor(.secondary)
                    }
                    
//                    HStack {
//                        Text("Highest Price:")
//                        Spacer()
//                        Text("$\(highestPrice(), specifier: "%.2f")")
//                            .foregroundColor(.secondary)
//                    }
//                    
//                    HStack {
//                        Text("Lowest Price:")
//                        Spacer()
//                        Text("$\(lowestPrice(), specifier: "%.2f")")
//                            .foregroundColor(.secondary)
//                    }
//                    
//                    HStack {
//                        Text("Average Price:")
//                        Spacer()
//                        Text("$\(averagePrice, specifier:"%.2f")")
//                            .foregroundColor(.secondary)
//                    }
                    
                }
            } .padding()
        }
    }
}

#Preview {
    MenuView()
}
