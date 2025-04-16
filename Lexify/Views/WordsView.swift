//
//  WordsView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct WordsView: View {
    @State private var showTranslate = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            VStack {
                Spacer()
                
                VStack(spacing: 23) {
                    
                    VStack(alignment: .leading) {
                        Text("language")
                            .font(.system(size: 12, weight: .black))
                        Text("word_original")
                            .font(.system(size: 36, weight: .black))
                    }

                    
                    ZStack {
                        Text("word_tranclated")
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
                Spacer()
                Button {
                    //next did tap
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
    }
}

#Preview {
    WordsView()
}
