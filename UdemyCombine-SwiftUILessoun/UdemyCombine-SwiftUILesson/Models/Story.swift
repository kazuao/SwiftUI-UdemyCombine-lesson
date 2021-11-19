//
//  Story.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation

struct Story: Codable {
    let id: Int
    let title: String
    let url: String
}

extension Story {
    static func placeholder() -> Story {
        return .init(id: 0, title: "N/A", url: "")
    }
}
