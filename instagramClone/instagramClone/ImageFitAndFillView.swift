//
//  ImageFitAndFillView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/13.
//

import SwiftUI

struct ImageFitAndFillView: View {
    var body: some View {
        VStack {
            //Image(systemName: "trash.square.fill")
            //.resizable()
            //            Rectangle()
            //                .frame(width: 200, height: 100)
            Image(systemName: "trash.square.fill")
                .resizable()
                .frame(width: 200, height: 100)
            Image(systemName: "trash.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 100)
                .border(.pink, width: 1)
            Image(systemName: "trash.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .border(.blue, width: 1)
                .clipped()
            Image(systemName: "trash.square.fill")
                .resizable()
            //.aspectRatio(contentMode: .fit)
            // .aspectRatio(contentMode: .fit) 코드와 .scaledToFit() 코드랑 똑같음
                .scaledToFit()
                .frame(width: 200, height: 100)
                .border(.pink, width: 1)
            Image(systemName: "trash.square.fill")
                .resizable()
            //.aspectRatio(contentMode: .fill)
                .scaledToFill()
                .frame(width: 200, height: 100)
                .border(.blue, width: 1)
                .clipped()
            Image(systemName: "trash.square.fill")
                .resizable()
                //.aspectRatio(contentMode: .fit)
                .aspectRatio(3/1, contentMode: .fit)
                .frame(width: 200, height: 100)
                .border(.pink, width: 1)
            Image(systemName: "trash.square.fill")
                .resizable()
                .aspectRatio(3, contentMode: .fill)
                .frame(width: 200, height: 100)
                .border(.blue, width: 1)
                .clipped()
            
        }
    }
}

struct ImageFitAndFillView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFitAndFillView()
    }
}
