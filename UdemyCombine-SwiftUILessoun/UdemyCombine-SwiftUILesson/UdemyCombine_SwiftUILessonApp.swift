//
//  UdemyCombine_SwiftUILessonApp.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import SwiftUI

@main
struct UdemyCombine_SwiftUILessonApp: App {
    var body: some Scene {
        WindowGroup {
            StoryListView()
//                .environmentObject(UserSettings())
        }
    }

    init() {
        NavigationConfigurator.setupNavigationBar()
    }
}
