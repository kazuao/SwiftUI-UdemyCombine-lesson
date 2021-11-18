import UIKit
import Combine

let numbers = (1...10).publisher

numbers.prefix(2)
    .sink {
        print($0) // 1, 2
    }

numbers.prefix(while: { $0 < 5 })
    .sink {
        print($0)
    }
