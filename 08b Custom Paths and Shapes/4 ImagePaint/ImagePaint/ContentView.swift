//
//  ContentView.swift
//  ImagePaint
//
//  Created by Kurt McMahon on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 1.
        //Text("Hello World")
        //    .frame(width: 300, height: 300)
        //    .background(Color.red)
        
        // 2.
        //Text("Hello World")
        //    .frame(width: 300, height: 300)
        //    .border(Color.red, width: 30)
        
        // 3.
        //Text("Hello World")
        //    .frame(width: 300, height: 300)
        //    .background(Image("example"))
        
        // 4.
        //Text("Hello World")
        //    .frame(width: 300, height: 30)
        //    .border(Image("example"), width: 30)
        
        // 5.
        //Text("Hello World")
        //    .frame(width: 300, height: 300)
        //    .border(ImagePaint(image: Image("example"), scale: 0.2), width: 30)

        // 6.
        //Text("Hello World")
        //    .frame(width: 300, height: 300)
        //    .border(ImagePaint(image: Image("example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)

        // 7.
//        Capsule()
//           .strokeBorder(ImagePaint(image: Image("example"), scale: 0.1), lineWidth: 20)
//           .frame(width: 300, height: 200)
        
        // 7.
         Rectangle()
            .fill(ImagePaint(image: Image("example"), scale: 0.1))
            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
