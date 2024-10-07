//
//  FeedView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/07.
//

import SwiftUI

struct FeedView: View {
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
                
                FeedCellView()
                FeedCellView()
                FeedCellView()
                FeedCellView()
                
                Spacer()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
