//
//  StoryDetailView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct StoryDetailView: View {

    // MARK: Property
    @ObservedObject private var storyDetailVM: StoryDetailViewModel


    // MARK: Variable
    var storyId: Int


    // MARK: Initialize
    init(storyId: Int) {
        self.storyId = storyId
        storyDetailVM = .init()
    }


    // MARK: View
    var body: some View {

        VStack {
            Text(storyDetailVM.title)

            WebView(url: storyDetailVM.url)
        }
        .onAppear {
            storyDetailVM.fetchStoryDetails(storyId: storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
