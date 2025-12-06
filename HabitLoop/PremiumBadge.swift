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
                .font(Font.system(size: 15))
        }
        
    }
}

#Preview {
    PremiumBadge()
}
