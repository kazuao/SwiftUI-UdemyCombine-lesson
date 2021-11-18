import UIKit
import Combine

let subscription = Timer.publish(every: 1.0,   // 感覚
                                 on: .current, // tread
                                 in: .default) // mode
    .autoconnect()
    .scan(0) { counter, _ in
        counter + 1
    }
    .sink {
        print($0)
    }
