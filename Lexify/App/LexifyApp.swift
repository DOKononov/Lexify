//
//  LexifyApp.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

@main
struct LexifyApp: App {
    var body: some Scene {
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
