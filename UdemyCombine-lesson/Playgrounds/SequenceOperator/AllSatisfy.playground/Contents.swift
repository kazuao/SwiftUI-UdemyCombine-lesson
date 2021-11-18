import UIKit
import Combine

let publisher = [1, 2, 3, 4, 5, 6, 7].publisher

// 全部が合致するか
publisher
    .allSatisfy { $0 % 2 == 0 } // booleanで返却
    .sink {
        print($0) // false
    }

publisher
    .allSatisfy { $0 < 10 }
    .sink {
        print($0) // true
    }
