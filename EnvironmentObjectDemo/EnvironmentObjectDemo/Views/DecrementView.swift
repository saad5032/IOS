//
//  DecrementView.swift
//  EnvironmentObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

struct DecrementView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("Current Score")
                .font(.title)
                .padding()
            
            Text("\(userSettings.score)")
                .font(.largeTitle)
                .bold()
            
            Button(action: {
                userSettings.score -= 1
            }, label: {
                Text("Decrement")
                    .bold()
                    .padding(12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }
    }

}

struct DecrementView_Previews: PreviewProvider {
    static var previews: some View {
        DecrementView()
            .environmentObject(UserSettings())
    }
}
