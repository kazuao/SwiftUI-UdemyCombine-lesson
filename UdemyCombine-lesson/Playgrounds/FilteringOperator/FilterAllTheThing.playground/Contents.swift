import UIKit
import Combine

let numbers = (1...10).publisher

// 1. Skip the first 50 values emitted by the upstream publisher.
numbers.dropFirst(50)
    .sink {
        print($0)
    }

// 2. Take the next 20 values after those first 50 values.
numbers.dropFirst(50)
    .prefix(20)
    .sink {
        print($0)
    }

// 3. Only take even numbers.
numbers.dropFirst(50)
    .prefix(20)
    .filter{ $0 % 2 == 0 }
    .sink {
        print($0)
    }
