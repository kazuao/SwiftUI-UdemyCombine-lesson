//
//  StoryListViewModel.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {

    // MARK:  Property
    private var cancellable: AnyCancellable?


    // MARK: Variable
    @Published var stories = [StoryViewModel]()


    // MARK: Initialize
    init() {
        fetchTopStories()
    }
}


// MARK: - Setup
private extension StoryListViewModel {

    func fetchTopStories() {
        cancellable = WebServices().getAllTopStories()
            .map { stories in
                stories.map { StoryViewModel(story: $0) }
            }
            .sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
                self.stories = storyViewModels
            })
    }
}

