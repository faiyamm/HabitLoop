//
//  CustomerModel.swift
//  HabitLoop
//
//  Created by Fai on 03/12/25.
//

import Foundation

class Customer: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var visits: Int
    var isLoyaltyMember: Bool
    
    init(name: String, email: String, visits: Int, isLoyaltyMember: Bool) {
        self.name = name
        self.email = email
        self.visits = visits
        self.isLoyaltyMember = isLoyaltyMember
    }
    
    func summary() -> String {
        "\(name) (\(email)) - \(visits) completions"
    }
}
