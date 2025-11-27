//
//  AboutView.swift
//  HabitLoop
//
//  Created by Fai on 21/11/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("About HabitLoop")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 250)
                .padding(.bottom, 50)

                Text("This app is designed to help users manage their tasks efficiently and stay organized throughout the day.")
                    .font(.system(size: 20))
                    
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)
            }
            HStack {
                Image(systemName: "leaf.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.brown)
                
                Image(systemName: "globe.americas.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)

                Image(systemName: "apple.meditate.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.green)

            }
            
            Spacer()
            
            NavigationLink(destination: ReservationForm()) {
                Text("Start")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(99)
            }
        } .padding(.horizontal)
    }
}

#Preview {
    AboutView()
}
