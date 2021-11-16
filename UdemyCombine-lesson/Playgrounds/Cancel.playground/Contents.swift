import UIKit

let notification = Notification.Name("MyNotification")

//        let center = NotificationCenter.default
//
//        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
//            print("Notification received")
//        }
//
//        center.post(name: notification, object: nil)
//
//        center.removeObserver(observer)

let publisher = NotificationCenter.default.publisher(for: notification, object: nil)

let subscription = publisher.sink { _ in
    print("Notification received")
}

NotificationCenter.default.post(name: notification, object: nil)

// subscriptionの前にpostをしてもstreamは流れない
//        let subscription = publisher.sink { _ in
//            print("Notification received")
//        }

subscription.cancel() // キャンセルできる
