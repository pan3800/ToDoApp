//
//  SignupBackgroundView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/29.
//

import SwiftUI

struct SignupBackgroundView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            content
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
            })
    }
}
