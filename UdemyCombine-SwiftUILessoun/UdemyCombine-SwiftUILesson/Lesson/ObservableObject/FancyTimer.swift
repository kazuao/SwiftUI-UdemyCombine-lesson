//
//  FancyTimer.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/19.
//

import Foundation
import SwiftUI
import Combine

// ObservableObject: 観測可能なクラス
class FancyTimer: ObservableObject {

    @Published var value: Int = 0

    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
