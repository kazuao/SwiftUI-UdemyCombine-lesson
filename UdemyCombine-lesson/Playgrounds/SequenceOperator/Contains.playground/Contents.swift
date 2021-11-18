import UIKit
import Combine

let publisher = ["A", "B", "C", "D", "E"].publisher

// 含まれるか
publisher
    .contains("C") // booleanで返却される
    .sink {
        print($0) // true
    }


publisher
    .contains("F")
    .sink {
        print($0) // false
    }

