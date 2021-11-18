import UIKit
import Combine

let publisher = (1...10).publisher

publisher.scan([]) { numbers, value -> [Int] in
    print("numbers: \(numbers), value: \(value)")
    return numbers + [value]
}
.sink {
    print($0)
}

/*
 numbers: [], value: 1
 numbers: [1], value: 2
 numbers: [1, 2], value: 3
 numbers: [1, 2, 3], value: 4
 numbers: [1, 2, 3, 4], value: 5
 numbers: [1, 2, 3, 4, 5], value: 6
 numbers: [1, 2, 3, 4, 5, 6], value: 7
 numbers: [1, 2, 3, 4, 5, 6, 7], value: 8
 numbers: [1, 2, 3, 4, 5, 6, 7, 8], value: 9
 numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9], value: 10
 
 [1]
 [1, 2]
 [1, 2, 3]
 [1, 2, 3, 4]
 [1, 2, 3, 4, 5]
 [1, 2, 3, 4, 5, 6]
 [1, 2, 3, 4, 5, 6, 7]
 [1, 2, 3, 4, 5, 6, 7, 8]
 [1, 2, 3, 4, 5, 6, 7, 8, 9]
 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 */
