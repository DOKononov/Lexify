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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(isLoaded ? .green : .black)
                    Spacer()
                    Text(title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
                
                WebView(url: $link.linkStr) { self.isLoaded = $0 }
                
            }
        }
        .background(Color(uiColor: UIColor.systemGray5))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            if let url = URL(string: link.linkStr) {
                self.title = url.host ?? ""
            }
        }
    }
}

#Preview {
    LinkPreview(link: WordLink())
}
