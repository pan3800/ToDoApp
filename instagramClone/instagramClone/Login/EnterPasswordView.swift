//
//  EnterPasswordView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/28.
//

import SwiftUI

struct EnterPasswordView: View {
    var body: some View {
        SignupBackgroundView {
            VStack() {
                Text("비밀번호 만들기")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                Text("다른 사람이 추측할 수 없는 6자 이상의 문자 또는 숫자로 비밀번호를 만드세요.")
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                SecureField("비밀번호", text: .constant(""))
                    .modifier(InstagramTextFieldModifier())
                
                NavigationLink {
                    EnterNameView()
                } label: {
                    Text("다음")
                        .foregroundStyle(.white)
                        .frame(width: 363, height: 42)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Spacer()
            }
        }
    }
}

struct EnterPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPasswordView()
    }
}
