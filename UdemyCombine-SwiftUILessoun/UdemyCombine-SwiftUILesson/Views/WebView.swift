//
//  WebView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    typealias UIViewType = WKWebView

    var url: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else { return WKWebView.pageNotFoundView() }

        let request = URLRequest(url: url)

        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {

        guard let url = URL(string: url) else { return }

        let request = URLRequest(url: url)

        uiView.load(request)
    }
}
