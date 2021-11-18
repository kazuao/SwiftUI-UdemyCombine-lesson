import UIKit
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1.combineLatest(publisher2)
    .sink {
        print("p1: \($0), p2: \($1)")
    }

publisher1.send(1)
publisher2.send("hoge")

publisher2.send("fuga")
publisher1.send(2)

/*
 p1: 1, p2: hoge
 p1: 1, p2: fuga
 p1: 2, p2: fuga
 */
