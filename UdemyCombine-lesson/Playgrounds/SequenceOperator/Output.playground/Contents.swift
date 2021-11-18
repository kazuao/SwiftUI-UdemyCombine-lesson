import UIKit
import Combine

let publisher = ["A", "B", "C", "D", "E"].publisher

// 指定の範囲を出力
publisher
    .output(at: 1) // indexのs指定
    .sink {
        print($0) // B
    }

publisher
    .output(in: (0...2)) // 範囲の指定
    .sink {
        print($0) // A, B, C
    }
