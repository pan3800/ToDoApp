//
//  ContentView.swift
//  MVVMTutorial
//
//  Created by 임채성 on 2024/07/17.
//

import SwiftUI

struct NumberModel {
    var number: Int
}


class ContentViewModel : ObservableObject {
    @Published var model = NumberModel(number: 0)
    
    func plusLogic() {
        if model.number % 2 == 0 {
            // 나머지가 0이면 = 짝수이면
            model.number += 1
        } else { // 홀수이면
            model.number *= 2
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.model.number)")
            Button {
                viewModel.plusLogic()
            } label: {
                Text("증가")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
