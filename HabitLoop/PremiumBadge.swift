//
//  PremiumBadge.swift
//  HabitLoop
//
//  Created by Fai on 01/12/25.
//

import SwiftUI

struct PremiumBadge: View {
    var body: some View {
        
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("Premium")
                .font(.caption)
        }
        .padding(5)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(5)
        
    }
}

#Preview {
    PremiumBadge()
}
