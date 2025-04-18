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
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .white
    }
    
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
