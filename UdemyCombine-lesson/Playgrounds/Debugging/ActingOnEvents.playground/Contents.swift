import UIKit
import Combine

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError()
}

let request = URLSession.shared.dataTaskPublisher(for: url)

let subscription = request
    // debugに便利
    .handleEvents(receiveSubscription: { _ in print("Subscription Received") },
                  receiveOutput: { _, _ in print("Received Output") },
                  receiveCompletion: { _ in print("Received Completion") },
                  receiveCancel: { print("Received Cancel") },
                  receiveRequest: { _ in print("Received Request") })
    .sink(receiveCompletion: { print($0) }, receiveValue: { data, response in
        print(data)
    })
