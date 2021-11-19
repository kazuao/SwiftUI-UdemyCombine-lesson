//
//  EpisodeView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct EpisodeView: View {

    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")

    @State private var isPlaying = false

    var body: some View {

        VStack {

            Text(episode.name)
                .font(.title)
                .foregroundColor(isPlaying ? .green : .black)

            Text(episode.track)
                .foregroundColor(.secondary)

            PlayButton(isPlaying: $isPlaying) // 引数として渡すことでBiningしている
        }
    }
}


struct PlayButton: View {

    // EpisodeViewのisPlayingとBindingしている
    @Binding var isPlaying: Bool

    var body: some View {

        Button(action: {
            isPlaying.toggle()
        }, label: {
            Text("Play")
        })
            .padding(12)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
