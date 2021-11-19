//
//  FancyScoreView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct FancyScoreView: View {

    @EnvironmentObject var userSettings: UserSettings

    var body: some View {

        VStack {

            Text("\(userSettings.score)")

            Button("Increment Score") {
                userSettings.score += 1
            }
            .padding()
            .background(.green)
        }
        .padding()
        .background(.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
