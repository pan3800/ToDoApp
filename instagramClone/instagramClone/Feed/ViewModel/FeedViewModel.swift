//
//  FeedViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        Task {
            await loadAllPosts()
        }
    }
    
    func loadAllPosts() async {
        guard let posts = await PostManager.loadAllPosts() else { return }
        self.posts = posts
//        do {
//            let documents = try await Firestore.firestore().collection("posts").order(by: "date", descending: true)
//                .getDocuments().documents
//
//            //방법3
//            self.posts = try documents.compactMap({ document in
//                print("posts:", document)
//                return try document.data(as: Post.self)
//            })
//        } catch {
//            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
//        }
    }
}
