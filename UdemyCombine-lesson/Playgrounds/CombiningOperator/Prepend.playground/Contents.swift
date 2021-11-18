import UIKit

let numbers = (1...5).publisher
let publisher2 = (500...510).publisher

numbers
    // どんどん前に追加される
    .prepend(100, 101) // numbersの前に入れ込む
    .prepend(-1, -2) // -1, -2 100, 101, 1, 2, 3, 4, 5
    .prepend([45, 67]) // 45, 67,  -1, -2 100, 101, 1, 2, 3, 4, 5
    .prepend(publisher2) // 500 ... 510, 45, 67 ...
    .sink {
        print($0) // 100, 101, 1, 2, 3, 4, 5
    }

