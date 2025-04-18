//
//  LinkPreview.swift
//  Lexify
//
//  Created by Dmitry Kononov on 17.04.25.
//

import SwiftUI

struct LinkPreview: View {
    @State var link: WordLink
    @State private var isLoaded: Bool = false
    @State private var title = ""
    
    var body: some View {
        ZStack {
            VStack {
                WebView(url: $link.linkStr) { self.isLoaded = $0 }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isLoaded ? .green : .black)
            }
        }
        .background(Color(uiColor: UIColor.systemGray5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            if let url = URL(string: link.linkStr),
               let host = url.host {
                title = host
            }
        }
    }
}

#Preview {
    LinkPreview(link: WordLink())
}
