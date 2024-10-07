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
    }
}
