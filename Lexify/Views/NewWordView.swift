//
//  NewWordView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

struct NewWordView: View {
    
    @State var word: String = ""
    @State var translate: String = ""
    @State var description: String = ""
    @Binding var showNewWord: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    showNewWord.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .font(.system(size: 16))
                }
            }
            
            VStack(alignment: .leading) {
                Text("TR")
                    .font(.system(size: 12, weight: .black))
                HStack {
                    TextField("Word", text: $word)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color(uiColor: .systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    TextField("Translate", text: $translate)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color(uiColor: .systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Description")
                    .font(.system(size: 14, weight: .black))
                    .padding(.top, 23)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(uiColor: .systemGray5))

                    CustomTextEditor(text: $description)
                        .padding(8)
                }
                .frame(height: 90)

            }
            
            Spacer()
            Button {
                showNewWord.toggle()
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
    NewWordView(showNewWord: .constant(true))
}

struct CustomTextEditor: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
