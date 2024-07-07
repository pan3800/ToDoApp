//
//  ContentView.swift
//  SampleLeeoSettingApp
//
//  Created by 임채성 on 2024/07/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        HStack {
                            Image(systemName: "airplane")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(.all, 10)
                                .background(.green)
                                .clipShape(Circle())
                            
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Leeo")
                                    .font(.system(size: 24))
                                    .fontWeight(.regular)
                                Text("Apple ID, iCloud, 미디어 및 구입")
                                    .font(.system(size: 14))
                            }
                            .padding(.leading, 6)
                        }
                        .padding(.vertical, 10)
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink("스크린 타임") {
                            Text("스크린 타임 화면")
                        }
                    }
                }
                Section {
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink("일반") {
                            Text("일반 화면")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink("손위운 사용") {
                            Text("손위운 사용 화면")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.all, 4)
                            .background(.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                        
                        NavigationLink("개인 정보 보호") {
                            Text("개인 정보 보호 화면")
                        }
                    }
                }
            }
            .navigationTitle(Text("설정"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
