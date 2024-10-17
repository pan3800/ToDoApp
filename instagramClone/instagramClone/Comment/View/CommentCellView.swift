//
//  CommentCellView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/17.
//

import SwiftUI
import Kingfisher

struct CommentCellView: View {
    let comment: Comment
    var body: some View {
        HStack {
            if let imageUrl =  comment.commentUser?.profileImageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(comment.commentUser?.username ?? "")
                    Text(comment.date.relativeTimeString())
                        .foregroundStyle(.gray)
                }
                Text(comment.commentText)
            }
        }
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView(comment: Comment.DUMMY_COMMENT)
    }
}
