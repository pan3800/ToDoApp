//
//  FeedCellView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    @State var viewModel: FeedCellViewModel
    
    init(post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .overlay(alignment: .top) {
                    HStack {
                        Image("image_lion4")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .overlay() {
                                Circle()
                                    .stroke(Color(red: 191/255, green: 11/255, blue: 180/255), lineWidth: 2)
                            }
                        Text("general.cat")
                            .foregroundStyle(.white)
                            .bold()
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                    }
                    .padding(5)
                }
            HStack {
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .imageScale(.large)
            .padding(.horizontal)
            Text("좋아요 25,239개")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text("general.cat" + " " + viewModel.post.caption)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text("댓글 25개 더보기")
                .foregroundStyle(.gray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text("3일전")
                .foregroundStyle(.gray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
        }
        .padding(.bottom)
    }
}

//struct FeedCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCellView(post: Post(id: "iMP2FX2V6cDGwhMAodRw", userId: "GzaQsA3lFlaPyP9TJi9poTnEgG42", caption: "Panda", like: 0, imageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-a5529.appspot.com/o/images%2F4826A681-3158-43E0-AFD2-7D40E9CB2A39?alt=media&token=614cee3b-2b12-462f-bab5-1836fe8620b0", date: Date()))
//    }
//}
