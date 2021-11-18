import UIKit
import Combine

let publisher = ["A", "B", "C", "D", "E"].publisher

publisher
    .first()
    .sink {
        print($0) // A
    }

publisher
    .first(where: { "Cat".contains($0) })
    .sink {
        print($0) // C
    }

publisher
    .last()
    .sink {
        print($0) // E
    }
