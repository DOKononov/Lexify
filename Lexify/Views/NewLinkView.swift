//
//  NewLinkView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct NewLinkView: View {
    @State var title: String = ""
    @State var link: String = ""
    @Binding var showNewLink: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New link")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    showNewLink.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .font(.system(size: 16))
                }
            }
            
            VStack(alignment: .leading) {

                HStack {
                    TextField("Title", text: $title)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color(uiColor: .systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    TextField("Link", text: $link)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color(uiColor: .systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            
            Spacer()
            Button {
                showNewLink.toggle()
                //todo: save
            } label: {
                Text("Save")
                    .foregroundStyle(.white)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(.capsule)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical, 13)
        .padding(.horizontal, 20)
    }
}

#Preview {
    NewLinkView(title: "Title", link: "Link", showNewLink: .constant(true))
}
