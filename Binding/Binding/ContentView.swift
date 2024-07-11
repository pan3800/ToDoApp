//
//  ContentView.swift
//  Binding
//
//  Created by 임채성 on 2024/07/11.
//

import SwiftUI

struct MyView: View {
    @Binding var text: String
    
    var body: some View {
        Text("My View")
        Text(text)
        
        Button("하트추가") {
            text = text + "❤️"
        }
    }
}

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Text(text)
                .border(Color.blue, width: 1)
            TextField("글자를 입력해주세요", text: $text)
            Button("하트추가") {
                text = text + "❤️"
            }
            Divider()
            MyView(text: $text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
