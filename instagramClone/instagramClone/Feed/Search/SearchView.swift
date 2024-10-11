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
    
    var body: some View {
        
        List {
            ForEach(viewModel.users) { user in
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
        }
        .listStyle(.plain)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
