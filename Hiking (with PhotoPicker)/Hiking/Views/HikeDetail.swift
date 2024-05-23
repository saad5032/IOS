//
//  HikeDetail.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/9/23.
//

import SwiftUI

struct HikeDetail: View {
    
    let hike: Hike
    
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Image(uiImage: hike.image)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            
            Text(hike.name)
                .font(.title)
                .bold()
                .padding(4)
            
            Text("\(String(format: "%.1f miles", hike.miles))")
                .font(.title3)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike.all()[0])
    }
}
