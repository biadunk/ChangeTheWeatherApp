//
//  ContentView.swift
//  ChangeTheWeatherApp
//
//  Created by Kacper Biaduń on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack{
            Color(isNight ? .black : .systemBlue)
                .ignoresSafeArea()
            
            VStack{
                TimeOfDayImage(imageTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                Button {
                    isShowingSheet = true
                } label: {
                    ButtonLabel(title: "Change Time Of Day", imageName: "clock.fill", color: .green)
                }
                .padding(.top, 100)
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            ChangeTimeOfDayView(isNight: $isNight)
        }
    }
}

struct ButtonLabel: View {
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imageName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(22)
            .padding()
        
    }
}

struct TimeOfDayImage: View {
    var imageTitle: String
    
    var body: some View {
        Image(systemName: imageTitle)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
