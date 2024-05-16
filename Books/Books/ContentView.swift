//
//  ContentView.swift
//  Books
//
//  Created by Saaduddin Syed on 9/30/23.
//

import SwiftUI

// Making a copy(book) of the instance bookData which we made in BootData file according to the schema i.e., BookModel.

// Using book i will have access to all the property values of book class using (.) way like book.title, book.description etc.,

let book = bookData
let total = 39.99

// Using NumberFormatter to have currency.
var format : NumberFormatter {
    let f = NumberFormatter()
    f.numberStyle = .currency
    // I used numberStyle property of class NumberFormatter() via f and also used its build in value .currency
    return f
}

struct ContentView: View {
 
    var body: some View {
        ScrollView (showsIndicators: false){
            
// In this V stack all the views will be arranged in vertical.
            VStack {
                
// Using image "cover" from Assets. Applying resizable to set the frame as per requirement of assignment (200*250). Also making the corners of image a little bit round.
         
                Image("cover")
                    .resizable()
                    .frame(width: 200,height: 250)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(10)
                
    // Setting text(author) opacity and font size.
                
                Text(book.authors)
                    .opacity(0.5)
                    .font(.title3)
                
    // Setting text(title) font size and boldness.
                
                Text(book.title)
                    .font(.title)
                    .fontWeight(.heavy)
                
    // Setting text(edition) font size and boldness.
                
                Text(book.edition)
                    .fontWeight(.heavy)
                    .font(.title3)
                
    // Setting text(description) in proper space via padding and setting its opacity level.
                
                Text(book.description)
                    .padding(10)
                    .opacity(0.5)
                
    // Using for-each inside Hstack to have this categories in horizal manner and overlaying the capsule on this categories to have proper border.
    
                HStack{
                    ForEach(book.categories,id:\.self){category in
                        Text(category)
                            .padding(8)
                            .overlay(
                                Capsule()
                                .stroke(Color.black, lineWidth: 3)
                            )
                            .padding(8)
                            .clipShape(Capsule())
                    }
                }
                Divider()
                    .padding(.horizontal)
            }
            
    //Using Z-stack to place text on top of capsule and using formatter in text view to have currency.
            ZStack{
                Capsule(style: .continuous)
                    .frame(width: 140, height: 40)
                    .foregroundColor(.black)
                Text("Buy for \(NSNumber(value: total), formatter:format)")
                    .foregroundColor(.white)
                    .padding()

            }
            Spacer()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
