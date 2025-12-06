//
//  MenuItemRowView.swift
//  HabitLoop
//
//  Created by Fai on 01/12/25.
//

import SwiftUI

struct MenuItemRowView: View {
    let name: String
    let price: Double
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.headline)
            
            if price > 10 {
                PremiumBadge()
            }
            
            Spacer()
            Text("\(price, specifier: "%.2f")")
                .foregroundColor(.secondary)
            
        } .padding()
    }
}

#Preview {
    MenuItemRowView(name: "Sample Dish Name", price: 15.50)
}
