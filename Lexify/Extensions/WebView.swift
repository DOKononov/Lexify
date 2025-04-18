//
//  WebView.swift
//  Lexify
//
//  Created by Dmitry Kononov on 17.04.25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var url: String
    var isLoading: (Bool) -> Void
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        if let pageUrl = URL(string: url) {
            let urlComponents = URLComponents(url: pageUrl, resolvingAgainstBaseURL: true)
            let request = URLRequest(url: urlComponents?.url ?? pageUrl)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator { isLoading in
            self.isLoading(isLoading)
        }
    }
    
}


class WebViewCoordinator: NSObject, WKNavigationDelegate {
    let isLoading: (Bool) -> Void
    init(isLoading: @escaping (Bool) -> Void) {
        self.isLoading = isLoading
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoading(true)
    }
}
