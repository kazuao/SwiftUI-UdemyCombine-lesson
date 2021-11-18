import UIKit
import Combine

let publisher = ["A", "B", "C", "D", "E"].publisher

publisher
    .count()
    .sink {
        print($0) // 5
    }


let publisher1 = PassthroughSubject<Int, Never>()

publisher1
    .count()
    .sink {
        print($0)
    }

publisher1.send(10) // これだけでは発火しない
publisher1.send(10)
publisher1.send(completion: .finished) // closeする必要がある

