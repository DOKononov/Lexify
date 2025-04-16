//
//  ContentView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewWord = false
    @State private var showNewLink = false
    
    
    var body: some View {
            TabView {
                Tab("List", systemImage: "list.dash") {
                    ListView(showNewWord: $showNewWord)
                }
                Tab("Words", systemImage: "textformat.abc") {
                    WordsView()
                }
                Tab("Links", systemImage: "link") {
                    LinkView(showNewLink: $showNewLink)
                }
            }
            .padding(.horizontal, 16)

            .fullScreenCover(isPresented: $showNewWord) {
                NewWordView(showNewWord: $showNewWord)
            }
            .fullScreenCover(isPresented: $showNewLink) {
                NewLinkView(showNewLink: $showNewLink)
            }
    }
}

#Preview {
    ContentView()
}
