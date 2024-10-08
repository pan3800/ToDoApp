//
//  FeedCellViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    var post: Post
    
    init(post: Post) {
        self.post = post
        Task {
            await loadUserData()
        }
    }
    
    func loadUserData() async {
        let userId = post.userId
        guard let user = await AuthManager.shared.loadUserData(userId: userId) else { return }
        post.user = user
    }
}
