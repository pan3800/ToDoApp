//
//  ContentView.swift
//  AsyncAwaitTask
//
//  Created by 임채성 on 2024/07/16.
//

import SwiftUI

struct ContentView: View {
    let imageUrlString = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FXCKNc%2Fbtq81UxJZuy%2FrYISOCIQbOsP32aMGSrzPk%2Fimg.png"
    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 200, height: 200)
            ScrollView {
                ForEach(0..<10) { _ in
                    AsyncImage(url: URL(string: imageUrlString))
//                    let data = try! Data(contentsOf: URL(string: imageUrlString)!)
//                    Image (uiImage: UIImage(data: data)!)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
