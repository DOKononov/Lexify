//
//  ListView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    @Binding var showNewWord: Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        //search
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 15, height: 15)
                            TextField("Search", text: $searchText)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        
                        
                        //cards
                        VStack(spacing: 20) {
                            CardItemView()
                            CardItemView()
                            CardItemView()
                            CardItemView()
                        }
                    }
                    
                }
            }.padding(.top, 16)

            Button {
                //action
                showNewWord.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundStyle(.green)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                }
            }
            .offset(x: -20, y: -30)
        }
    }
}

#Preview {
    ListView(showNewWord: .constant(true))
}

struct CardItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading)  {
                Text("Hello, World!")
                    .font(.system(size: 12, weight: .black))
                    .padding(.bottom, 5)
                Text("Hello, World!")
                    .padding(.bottom, 2)
                    .font(.system(size: 18, weight: .black))
                Text("Hello, World!")
                    .font(.system(size: 18, weight: .light))

            }

            Divider()
            
            VStack(alignment: .leading)  {
                Text("Hello, World!")
                    .font(.system(size: 12, weight: .black))
                    .foregroundStyle(Color(UIColor.systemGray2))
                    .padding(.bottom, 7)
                Text("Hello, World!")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}
