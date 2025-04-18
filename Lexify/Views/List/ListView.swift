//
//  ListView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    @State private var searchText = ""
    @Binding var showNewWord: Bool
    @ObservedResults(Word.self, sortDescriptor: SortDescriptor(keyPath: "word", ascending: true)) var wordItems
    
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
                                .textInputAutocapitalization(.never)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .searchable(text: $searchText, collection: $wordItems, keyPath: \.word)
                        
                        ForEach(wordItems, id: \.id) { word in
                            CardItemView(word: word) { $wordItems.remove(word) }
                        }
                    }.padding(16)
                    
                }
            }
            
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
    
    @State var word: Word
    @State private var offsetX: CGFloat = 0
    var onDelete: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .trailing) {
            removeView()
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading)  {
                    Text(word.language)
                        .font(.system(size: 12, weight: .black))
                        .padding(.bottom, 5)
                    Text(word.word)
                        .padding(.bottom, 2)
                        .font(.system(size: 18, weight: .black))
                    Text(word.translate)
                        .font(.system(size: 18, weight: .light))
                    
                }
                if word.wordDescription.count > 0 {
                    Divider()
                    
                    VStack(alignment: .leading)  {
                        Text("Description:")
                            .font(.system(size: 12, weight: .black))
                            .foregroundStyle(Color(UIColor.systemGray2))
                            .padding(.bottom, 7)
                        Text(word.wordDescription)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .offset(x: offsetX)
            .gesture(DragGesture()
                     
                .onChanged { value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                }
                .onEnded { value in
                    withAnimation {
                        if screenSize.width * 0.7 <  -value.translation.width {
                            withAnimation {
                                offsetX = -screenSize.width
                            }
                            onDelete?()
                        } else {
                            offsetX = 0
                        }
                    }
                }
            )
        }
    }
    
    
    @ViewBuilder
    func removeView() -> some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX * 0.5)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08, height: 0.1 * -offsetX * 0.08))
    }
}
