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
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                
                VStack {
                    ForEach(links, id: \.id) { link in
                        NavigationLink {
                            LinkPreview(link: link)
                        } label: {
                            LinkItem(link: link) {
                                withAnimation {
                                    $links.remove(link)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                Button {
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
            .navigationTitle("Links")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 16)
        }
        
    }
}

#Preview {
    LinkView(showNewLink: .constant(true))
}


struct LinkItem: View {
    @State var link: WordLink
    let delete: (() -> Void)
    var body: some View {
        HStack {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text(link.title)
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
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
    }
}
