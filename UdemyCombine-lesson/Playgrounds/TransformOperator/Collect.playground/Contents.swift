import UIKit
import Combine

["A", "B", "C", "D", "E"].publisher
//    .collect() // 配列を配列のまま使用できる  // ["A", "B", "C", "D", "E"]
    .collect(2) // ２つずつまとめられる // ["A", "B"] ["C", "D"] ["E"]
    .sink { value in
    print(value)
    }
