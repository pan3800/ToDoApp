//
//  LoginView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
//        LinearGradient(colors: [Color.red, Color.blue], startPoint: .top, endPoint: .bottom)
        LinearGradient(stops: [
            Gradient.Stop(color: .red, location: 0.1),
            Gradient.Stop(color: .blue, location: 0.8),
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
