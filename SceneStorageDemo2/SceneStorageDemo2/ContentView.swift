//
//  ContentView.swift
//  SceneStorageDemo2
//
//  Created by Kurt McMahon on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editorText = ""
    //@SceneStorage("mytext") private var editorText = ""
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
