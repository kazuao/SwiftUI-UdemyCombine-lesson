import UIKit
import Combine

let words = "apple apple fruit apple mango watermelon apple"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates() // 連続している重複を削除する
    .sink {
        print($0)
    }

