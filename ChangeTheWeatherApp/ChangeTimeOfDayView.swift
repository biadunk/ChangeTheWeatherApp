//
//  ChangeTimeOfDayView.swift
//  ChangeTheWeatherApp
//
//  Created by Kacper Biaduń on 21/04/2023.
//

import SwiftUI

struct ChangeTimeOfDayView: View {
    
    @Binding var isNight: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button{
                isNight = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Night", imageName: "moon.stars.fill", color: .black)
            }
            
            Button{
                isNight = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Day", imageName: "cloud.sun.fill", color: .blue)
            }
        }
    }
}
    
struct ChangeTimeOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTimeOfDayView(isNight: .constant(false))
    }
}
