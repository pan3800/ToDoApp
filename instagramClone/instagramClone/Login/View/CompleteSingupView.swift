//
//  CompleteSingupView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/28.
//

import SwiftUI

struct CompleteSingupView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var signupViewModel: SignupViewModel
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                Image("instagramLogo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 172, height: 172)
                    .foregroundColor(Color.gray)
                    .opacity(0.5)
                    .overlay {
                        Circle().stroke(Color.gray, lineWidth: 2)
                            .opacity(0.5)
                            .frame(width: 185, height: 185)
                    }
                    
                Text("\(signupViewModel.username)님, Instagram에 오신 것을 환영합니다.")
                    .font(.title)
                    .padding(.top, 30)
                    .padding(.horizontal)
                Spacer()
                
                BlueButtonView {
                    print("완료")
                    signupViewModel.createUser()
                } label: {
                    Text("완료")

                }
                Spacer()

            }
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

struct CompleteSingupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSingupView()
    }
}
