//
//  LinkView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct LinkView: View {
    @Binding var showNewLink: Bool
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            VStack {
                ScrollView {
                    LinkItem()
                        .padding(.bottom, 10)
                    LinkItem()
                        .padding(.bottom, 10)
                    LinkItem()
                        .padding(.bottom, 10)
                    
                }
            }.padding(.top, 16)
            
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
    }
}

#Preview {
    LinkView(showNewLink: .constant(true))
}


struct LinkItem: View {
    var body: some View {
        HStack {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text("LinkItem LinkItem LinkItem")
                    .font(.system(size: 14))
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
            }
        }
        .padding(20)
        .background(Color(UIColor.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            //tap
        }
    }
}
