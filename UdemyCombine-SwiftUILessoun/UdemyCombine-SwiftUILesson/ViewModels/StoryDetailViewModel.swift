//
//  StoryDetailViewModel.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {

    // MARK: Variable
    private var cancellable: AnyCancellable?
    @Published private var story = Story.placeholder()


    // MARK: Public
    func fetchStoryDetails(storyId: Int) {

        cancellable = WebServices().getStoryById(storyId: storyId)
            .catch { _ in Just(Story.placeholder()) }
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                self.story = story
            })
    }
}


extension StoryDetailViewModel {

    var title: String {
        return story.title
    }

    var url: String {
        return story.url
    }
}
