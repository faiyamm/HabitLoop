//
//  AboutView.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About App")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.blue)
            .padding()

            Text("This app is designed to help users manage their tasks efficiently and stay organized throughout the day.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding()
        }
        HStack {
            Image(systemName: "cloud")
                .font(.system(size: 30))
                .foregroundColor(.green)

            Image(systemName: "person")
                .font(.system(size: 30))
                .foregroundColor(.red)

            Image(systemName: "leaf")
                .font(.system(size: 30))
                .foregroundColor(.purple)
        }
    }
}

#Preview {
    AboutView()
}
