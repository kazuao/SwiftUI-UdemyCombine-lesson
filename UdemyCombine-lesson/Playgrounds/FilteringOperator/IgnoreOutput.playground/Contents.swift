import UIKit
import Combine

let numbers = (1...5000).publisher

numbers
    .ignoreOutput() // 中間の出力がなくなる
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
