//
//  LoginView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/21.
//

import SwiftUI

struct LoginView: View {
    
    let yellowColor = Color(red: 0.9960784314, green: 0.9764705882, blue: 0.9529411765)
    let redColor = Color(red: 0.9921568627, green: 0.9490196078, blue: 0.9725490196)
    let blueColor = Color(red: 0.9333333, green: 0.968627451, blue: 0.9960784314)
    let greenColor = Color(red: 0.937254902, green: 0.9882352941, blue: 0.9529411765)
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: yellowColor, location: 0.1),
                Gradient.Stop(color: redColor, location: 0.3),
                Gradient.Stop(color: blueColor, location: 0.6),
                Gradient.Stop(color: greenColor, location: 1),
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("instagramLogo")
                    .resizable()
                    .frame(width: 57, height: 57)
                
                Spacer()
                
                VStack(spacing: 20){
                    TextField("이메일주소", text: .constant(""))
                        .textInputAutocapitalization(.never)
                        .padding(12)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        }
                        .padding(.horizontal)
                    SecureField("비밀번호", text: .constant(""))
                        .textInputAutocapitalization(.never)
                        .padding(12)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        }
                        .padding(.horizontal)
                    Button {
                        print("로그인되었습니다.")
                    } label: {
                        Text("로그인")
                            .foregroundStyle(.white)
                            .frame(width: 363, height: 42)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Text("비밀번호를 잊으셨나요?")
                }
                
                Spacer()
                
                Button {
                    print("새 계정 만들기")
                } label: {
                    Text("새 계정 만들기")
                        .fontWeight(.bold)
                        .frame(width: 363, height: 42)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue, lineWidth: 1)
                        }
                }
                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
