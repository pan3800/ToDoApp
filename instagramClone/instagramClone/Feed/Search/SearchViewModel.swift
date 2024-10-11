//
//  SearchViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/11.
//

import Foundation

class SearchViewModel : ObservableObject{
    @Published var users: [User] = []
    
    init() {
        Task {
            await loadAllUserData()
        }
    }
    
    func loadAllUserData() async {
        self.users =  await AuthManager.shared.loadAllUserData() ?? []
    }
}
