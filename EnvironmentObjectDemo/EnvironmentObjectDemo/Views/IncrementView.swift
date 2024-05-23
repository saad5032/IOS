//
//  IncrementView.swift
//  EnvironmentObjectDemo
//
//  Created by Kurt McMahon on 3/22/22.
//

import SwiftUI

struct IncrementView: View {
    // This usersetting class is in Environment as we put it in app
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
                userSettings.score += 1
            }, label: {
                Text("Increment")
                    .bold()
                    .padding(12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }
    }
}

struct IncrementView_Previews: PreviewProvider {
    static var previews: some View {
        IncrementView()
            .environmentObject(UserSettings())
    }
}
