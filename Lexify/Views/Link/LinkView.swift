//
//  LinkView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI
import RealmSwift

struct LinkView: View {
    @Binding var showNewLink: Bool
    @ObservedResults(WordLink.self) var links
    @State private var selectedLink: WordLink?
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack {
                ForEach(links, id: \.id) { link in
                    
                    LinkItem(link: link) {
                        withAnimation {
                            $links.remove(link)
                        }
                    } open: {
                        selectedLink = link
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(16)
            
            Button {
                //action
                showNewLink.toggle()
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

        .fullScreenCover(item: $selectedLink) { link in
            LinkPreview(link: link)
        }
    }
}

#Preview {
    LinkView(showNewLink: .constant(true))
}


struct LinkItem: View {
    @State var link: WordLink
    @State var delete: (() -> Void)
    @State var open: (() -> Void)
    var body: some View {
        HStack {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text(link.title)
                    .font(.system(size: 14))
            }
            Spacer()
            Button {
                delete()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(20)
        .background(Color(UIColor.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            open()
        }
    }
}
