//
//  SearchView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/11.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State var searchText = ""
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                return user.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredUsers) { user in
                    NavigationLink {
                        ProfileView(viewModel: ProfileViewModel(user: user))
                    } label: {
                        HStack {
                            if let imageUrl = user.profileImageUrl {
                                KFImage(URL(string: imageUrl))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 53, height: 53)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 53, height: 53)
                                    .opacity(0.5)
                            }
                            VStack(alignment: .leading) {
                                Text(user.username)
                                Text(user.bie ?? "")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, prompt: "검색")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
