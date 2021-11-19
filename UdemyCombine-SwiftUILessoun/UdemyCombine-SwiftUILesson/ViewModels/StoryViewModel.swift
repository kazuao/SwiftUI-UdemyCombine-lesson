//
//  StoryViewModel.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation

struct StoryViewModel {

    let story: Story
    var id: Int {
        return story.id
    }

    var title: String {
        return story.title
    }

    var url: String {
        return story.url
    }
}
