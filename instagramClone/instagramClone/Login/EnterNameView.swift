//
//  EnterNameView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/28.
//

import SwiftUI

struct EnterNameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack() {
                Text("이름 입력")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                TextField("성명", text: .constant(""))
                    .textInputAutocapitalization(.never)
                    .padding(12)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .padding(.horizontal)
                
                NavigationLink {
                    EnterUsernameView()
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

struct EnterNameView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameView()
    }
}
