//
//  NewPostView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    @Binding var tabIndex: Int
    @StateObject var viewModel = NewPostViewModel()
    
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
            
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let image = self.viewModel.postImage { // self.postImage nil이 아니면 photosPicker로 사진이 장착한 후
                    image
                        .resizable()
                        //.aspectRatio(1, contentMode: .fit)
                        //.aspectRatio(contentMode: .fill)
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .clipped()
                    
                } else { // 장착 전
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        //.scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .tint(.black)
                        .padding()
                }
            }
            .onChange(of: viewModel.selectedItem) { newValue in
                Task {
                    await viewModel.convertImage(item: newValue)
                }
            }
            

            TextField("문구를 작성하거나 설명을 추가하세요...", text: $viewModel.caption)
            
            Spacer()
            
            Button {
                print("사진 공유")
                Task {
                    await viewModel.uploadPost()
                    viewModel.clearData()
                    tabIndex = 0 
                }
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
