import UIKit
import Combine

// 同じタイプである必要がある
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()


publisher1.merge(with: publisher2)
    .sink {
        print($0)
    }

publisher1.send(10)
publisher2.send(11)


publisher1.send(12)
publisher2.send(13)
