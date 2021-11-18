import UIKit
import Combine

let publisher = [1, -45, 3, 45, 100].publisher

publisher
    .min()
    .sink {
        print($0) // -45
    }

publisher
    .max()
    .sink {
        print($0) // 100
    }
