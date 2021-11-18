import UIKit
import Combine

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError() }

let request = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .print()
    .share() // hot? データのDLを一回で終わらす

// 1と2はデータがshareされる
let subscription1 = request
    .sink(receiveCompletion: { _ in },
          receiveValue: {
        print("Subscription 1")
        print($0)
    })

let subscription2 = request
    .sink(receiveCompletion: { _ in },
          receiveValue: {
        print("Subscription 2")
        print($0)
    })

// すでにDLが終わっているので、呼ばれない
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    _ = request
        .sink(receiveCompletion: { _ in },
              receiveValue: {
            print("Subscription 3")
            print($0)
        })
}
