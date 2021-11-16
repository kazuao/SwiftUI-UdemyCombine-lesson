import UIKit
import Combine

class StringSubscriber: Subscriber {

    // SubscriberProtocolへの準拠が必要
    typealias Input = String
    typealias Failure = Never

    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) // back pressure // 値の数を指定できる
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
//        return .none // 返却値なし（subscription.request()の指定数による）
        return .unlimited // なるべく多く返す
    }

    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
}


let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher

let subscriber = StringSubscriber()

publisher.subscribe(subscriber)
