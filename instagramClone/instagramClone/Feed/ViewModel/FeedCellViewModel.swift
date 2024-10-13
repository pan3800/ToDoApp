//
//  FeedCellViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        Task {
            await loadUserData()
            await checkLike()
        }
    }
    
    func loadUserData() async {
        let userId = post.userId
        guard let user = await AuthManager.shared.loadUserData(userId: userId) else { return }
        post.user = user
    }
}

extension FeedCellViewModel {
    func like() async {
        await PostManager.like(post: post)
        post.isLike = true
        post.like += 1
    }
    
    func unlike() async {
        await PostManager.unlike(post: post)
        post.isLike = false
        post.like -= 1
    }
    
    func checkLike() async {
        post.isLike = await PostManager.checkLike(post: post)
    }
}
