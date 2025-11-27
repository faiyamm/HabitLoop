//
//  ContentView.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 70))
                    .foregroundColor(.blue)
                    .padding(.bottom, 100)
                
                Text("Welcome to HabitLoop")
                    .font(Font.title)
                    .padding(.bottom, 50)
                
                NavigationLink {
                    AboutView()
                } label: {
                    Text("Learn About Us")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(99)
                }
            } .padding()
        }
    }
}

#Preview {
    ContentView()
}
