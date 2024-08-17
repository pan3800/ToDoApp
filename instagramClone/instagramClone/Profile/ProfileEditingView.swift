//
//  ProfileEditingView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/17.
//

import SwiftUI

struct ProfileEditingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Image("image_dog")
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .padding(.bottom, 10)
            Text("사진 또는 아바타 수정")
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("이름")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                TextField("이름", text: .constant("고양이대장군"))
                    .font(.title2)
                Divider()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("사용자 이름")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                TextField("사용자 이름", text: .constant("general.cat"))
                    .font(.title2)
                Divider()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("소개")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                TextField("소개", text: .constant("세계를 정복한다."))
                    .font(.title2)
                Divider()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
        }
        .navigationTitle("프로필 편집")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(.black)
                }
            }
        }
    }
}

struct ProfileEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingView()
    }
}
