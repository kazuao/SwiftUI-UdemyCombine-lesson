import UIKit
import Combine

let empty = Empty<Int, Never>()

empty
    .replaceEmpty(with: 1) // Emptyを1に置き換える
    .sink(receiveCompletion: { completion in
        print(completion)
    }, receiveValue: { value in
        print(value)
    })
