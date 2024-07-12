//
//  NewPostView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    @State var caption = ""
    @Binding var tabIndex: Int
    @State var selectedItem: PhotosPickerItem?
    @State var postImage: Image?
    
    func convertImage(item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
    
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
            
            PhotosPicker(selection: $selectedItem) {
                if let image = self.postImage { // self.postImage nil이 아니면 photosPicker로 사진이 장착한 후
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                } else { // 장착 전
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                        .tint(.black)
                }
            }
            .onChange(of: selectedItem) { newValue in
                Task {
                    await convertImage(item: newValue)
                }
            }
            

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
