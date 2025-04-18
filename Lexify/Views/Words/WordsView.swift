//
//  WordsView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI
import RealmSwift

struct WordsView: View {
    @State private var showTranslate = false
    @ObservedResults(Word.self) var wordItems
    @State private var word = Word()
    @State private var opacity: Double = 1
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()
                
                VStack(spacing: 23) {
                    
                    VStack(alignment: .leading) {
                        Text(word.language)
                            .font(.system(size: 12, weight: .black))
                        Text(word.word)
                            .font(.system(size: 36, weight: .black))
                    }
                    
                    
                    ZStack {
                        Text(word.translate)
                            .font(.system(size: 26, weight: .thin))
                            .opacity(showTranslate ? 1 : 0)
                        
                        Button {
                            withAnimation {
                                showTranslate.toggle()
                            }
                        } label: {
                            Text("Show Translate")
                                .padding(.vertical, 13)
                                .padding(.horizontal, 60)
                                .foregroundStyle(.white)
                                .background(Color.green)
                                .clipShape(.capsule)
                        }
                        .opacity(showTranslate ? 0 : 1)
                        
                    }
                    
                }
                .opacity(opacity)
                .offset(x: offset)
                Spacer()
                Button {
                    withAnimation {
                        offset = -50
                        opacity = 0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        showTranslate = false
                        randomWord()
                        offset = 30
                        withAnimation {
                            offset = 0
                            opacity = 1
                        }
                    }
                    
                    
                    
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                            .font(.system(size: 15))
                    }
                }
                .padding(.bottom, 38)
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            randomWord()
        }
    }
    
    private func randomWord() {
        let random = Int.random(in: 0...wordItems.count-1)
        self.word = wordItems[random]
    }
}

#Preview {
    WordsView()
}
