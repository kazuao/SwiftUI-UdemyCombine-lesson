//
//  WKWebView+.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation
import WebKit

extension WKWebView {

    static func pageNotFoundView() -> WKWebView {

        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page not found!</h1></body></html", baseURL: nil)
        return wk
    }
}
