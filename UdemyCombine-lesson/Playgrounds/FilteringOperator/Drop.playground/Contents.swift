import UIKit
import Combine

let numbers = (1...10).publisher

///* DropFirst */
//numbers.dropFirst(5) // 最初の5つを削除する
//    .sink {
//        print($0) // 6,7,8,9,10
//    }
//
///* DropWhile */
//numbers.drop(while: { $0 % 3 != 0 }) // 最初から条件に一致するまでdropする
//    .sink {
//        print($0) //　3,4,5,6,7,8,9,10
//    }

/* drop untilOutputFrom */
let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady) // isReadyが発火するまでsubscribeされない
    .sink {
        print($0)
    }

(1...10).forEach { n in
    taps.send(n)

    if n == 3 {
        isReady.send()
    }

    // 4, 5, 6, 7, 8, 9, 10
}
