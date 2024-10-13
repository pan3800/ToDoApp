//
//  CommentView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/13.
//

import SwiftUI

struct CommentView: View {
    @State var commentText = ""
    var body: some View {
        VStack {
            Text("댓글")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom, 15)
                .padding(.top, 30)
            
            Divider()
            
            ScrollView {
                LazyVStack {
                    Text("comment")
                    Text("comment")
                    Text("comment")
                    Text("comment")
                }
            }
            
            Divider()
            HStack {
                Image("profile_cat")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                TextField("댓글 추가", text: $commentText, axis: .vertical)
                Button {
                    
                } label: {
                    Text("보내기")
                }
                .tint(.black)
            }
            .padding()
            
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
