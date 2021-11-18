import UIKit
import Combine

let publisher1 = PassthroughSubject<String, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()

publishers
    .switchToLatest()
    .sink {
        print($0)
    }

publishers.send(publisher1)
publisher1.send("Publisher 1 - Value 1") // Publisher 1 - Value 1
publisher1.send("Publisher 1 - Value 2") // Publisher 1 - Value 1,  Publisher 1 - Value 2

publisher2.send("Publisher 2 - Value 1") // Publisher 1 - Value 1,  Publisher 1 - Value 2

publishers.send(publisher2) // switching to publisher 2
publisher2.send("Publisher 2 - Value 1")
// Publisher 1 - Value 1,  Publisher 1 - Value 2, Publisher 2 - Value 1


/* continue */
let images = ["huston", "denver", "seattle"]
var index = 0

// get image
func getImage() -> AnyPublisher<UIImage?, Never> {
    return Future<UIImage?, Never> { promise in

        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            promise(.success(UIImage(named: images[index])))
        }
    }
    .print() // RxSwiftでいうdebug()
    .map { $0 }
    .receive(on: RunLoop.main)
    .eraseToAnyPublisher()
}


let taps = PassthroughSubject<Void, Never>()

_ = taps.map { _ in getImage() }
    .switchToLatest()
    .sink {
        print($0)
    }

taps.send()

// 実行中に3番にswitchされるため、denverは返却されない
DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
    index + 1
    taps.send()
}

DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index + 1
    taps.send()
}

