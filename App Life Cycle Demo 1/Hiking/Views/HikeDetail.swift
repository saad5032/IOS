//
//  HikeDetail.swift
//  Hiking
//
//  Created by Kurt McMahon on 3/3/22.
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
            Text("\(String(format: "%.1f", hike.miles)) miles")
        }
        .navigationTitle("Details")
        .onAppear {
            print("HikeDetail appeared")
        }
        .onDisappear {
            print("HikeDetail disappeared")
        }

    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike.all()[0])
    }
}
