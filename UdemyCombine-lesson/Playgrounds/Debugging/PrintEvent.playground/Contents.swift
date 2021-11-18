import UIKit
import Combine

let publisher = (1...20).publisher

publisher
    .print("Debugging") // RxSwiftでいう、debug()
    .sink {
        print($0)
    }
