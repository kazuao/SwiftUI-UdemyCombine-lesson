//
//  StoryListView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct StoryListView: View {

    @ObservedObject private var storyListVM = StoryListViewModel()

    var body: some View {

        NavigationView {

            List(storyListVM.stories, id: \.id) { storyVM in
                NavigationLink(destination: StoryDetailView(storyId: storyVM.id), label: {
                    Text("\(storyVM.title)")
                })
            }

            .navigationBarTitle("Hacker News")
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
