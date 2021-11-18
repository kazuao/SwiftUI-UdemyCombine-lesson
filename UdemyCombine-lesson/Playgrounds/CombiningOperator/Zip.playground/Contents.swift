import UIKit
import Combine

// 両方の最新がそろってから発火する
// 数が揃っている必要がある
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1.zip(publisher2)
    .sink {
        print("p1: \($0), p2: \($1)")
    }

publisher1.send(1)
publisher1.send(2)
publisher2.send("2")
publisher2.send("3")
publisher1.send(3) // 揃ってないので表示されない

/*
 p1: 1, p2: 2
 p1: 2, p2: 3
 */
