//
//  FancyTimerView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import SwiftUI

struct FancyTimerView: View {

    // ObservableObjectのインスタンス化
    @ObservedObject var fancyTimer = FancyTimer()

    var body: some View {
        Text("\(fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct FancyTimerVew_Previews: PreviewProvider {
    static var previews: some View {
        FancyTimerView()
    }
}
