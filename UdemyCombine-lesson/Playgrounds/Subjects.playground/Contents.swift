import UIKit
import Combine

// Subjects
// - Publisher
// - Subscribers

enum MyError: Error {
    case subscribeError
}

class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError // 独自のエラー型を使用できる

    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
//        return .none
        return .max(1) // よくわからん
    }

    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
}

let subscriber = StringSubscriber()

// PassthroughSubject ≒ PublishSubject
let subject = PassthroughSubject<String, MyError>()

subject.subscribe(subscriber)

let subscription = subject.sink(receiveCompletion: { completion in
    print("Received Completion from sink")
}) { value in
    print("Received Value from sink", value)
}

subject.send("A")
subject.send("B")

subscription.cancel() // C以降のsinkが流れない

subject.send("C") // subscriptionのmaxを超えている場合、購読されない
subject.send("D")


