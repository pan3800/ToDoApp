//
//  ProfileView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/16.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("\(viewModel.username)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .opacity(0.6)
                            .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("124")
                                .fontWeight(.semibold)
                            Text("게시물")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("999")
                                .fontWeight(.semibold)
                            Text("팔로워")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("1403")
                                .fontWeight(.semibold)
                            Text("팔로잉")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    
                    Text("\(viewModel.name)")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Text("\(viewModel.bie)")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    
                    NavigationLink {
                        ProfileEditingView(viewModel: viewModel)
                    } label: {
                        Text("프로필 편집")
                            .bold()
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                    }
                    Divider()
                        .padding()
                    
                    LazyVGrid(columns: columns ,spacing: 2) {
                        ForEach(0..<10) { _ in
                            Image("profile_bear")
                                .resizable()
                                .scaledToFit()
                            Image("profile_cat")
                                .resizable()
                                .scaledToFit()
                            Image("profile_fox")
                                .resizable()
                                .scaledToFit()
                            Image("profile_penguin")
                                .resizable()
                                .scaledToFit()
                            Image("profile_tiger")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

