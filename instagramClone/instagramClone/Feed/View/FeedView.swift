//
//  FeedView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("instagramLogo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110)
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                        .imageScale(.large)
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    
                }
                .padding(.horizontal)
                
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        FeedCellView(post: post)
                    }
                }
           
                
                Spacer()
            }
        }
        .refreshable {
            await viewModel.loadAllPosts()
        }
        .task {
            await viewModel.loadAllPosts()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
