//
//  Extensions.swift
//  Lexify
//
//  Created by Dmitry Kononov on 16.04.25.
//

import SwiftUI

extension View {
    
    var screenSize: CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        return window.screen.bounds.size
    }
}


