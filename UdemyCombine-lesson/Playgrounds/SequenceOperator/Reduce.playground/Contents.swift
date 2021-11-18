import UIKit
import Combine

let publisher = [1, 2, 3, 4, 5, 6, 7].publisher


publisher
    // 引数は始める場所
    // すべての値を処理し、一つの値を返却する
    .reduce(0) { accumulator, value in
        print("accumulator: \(accumulator), and the value is \(value)")
        return accumulator + value
    }
    .sink {
        print($0)
    }

/*
 accumulator: 0, and the value is 1
 accumulator: 1, and the value is 2
 accumulator: 3, and the value is 3
 accumulator: 6, and the value is 4
 accumulator: 10, and the value is 5
 accumulator: 15, and the value is 6
 accumulator: 21, and the value is 7
 2
 */
