//
//  NewPostView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI

struct NewPostView: View {
    @State var caption = ""
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("뒤로가기")
                    tabIndex = 0
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
                Spacer()
                Text("새 게시물")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            Image("image_lion")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)

            TextField("문구를 작성하거나 설명을 추가하세요...", text: $caption)
            
            Spacer()
            
            Button {
                print("사진 공유")
            } label: {
                Text("공유")
                    .frame(width: 363, height: 42)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
           
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(tabIndex: .constant(2))
    }
}
