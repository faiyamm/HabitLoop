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
                    .font(.system(size: 90))
                    .foregroundColor(.blue)
                    .padding(.bottom, 50)
                
                Text("Welcome to HabitLoop")
                    .font(.title)
                    .padding(.bottom, 20)
                
                Text("Where focus meets productivity.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 150)
                
                NavigationLink {
                    ReservationForm()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Set a New Habit")
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(99)
                    
                }
                
                NavigationLink {
                    CustomerView()
                } label: {
                    HStack {
                        Image(systemName: "square.stack.3d.up")
                        Text("All Habit Records")
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(99)
                }
                
                NavigationLink {
                    MenuView()
                } label: {
                    HStack {
                        Image(systemName: "chart.bar")
                        Text("Task Analytics")
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(99)
                }
                
                NavigationLink {
                    AboutView()
                } label: {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Learn About Us  ")
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity)
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
