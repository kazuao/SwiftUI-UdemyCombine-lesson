//
//  ExampleView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct ExampleView: View {

    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        VStack {

            Text("\(userSettings.score)")
                .font(.largeTitle)

            Button("Increment Score") {
                userSettings.score += 1
            }

            FancyScoreView()
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
