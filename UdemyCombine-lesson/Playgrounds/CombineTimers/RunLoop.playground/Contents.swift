import UIKit
import Combine

let runLoop = RunLoop.main

let subscription = runLoop.schedule(after: runLoop.now,              // いつから
                                    interval: .seconds(2),           // 何秒ごとに
                                    tolerance: .milliseconds(100)) { // 許容範囲
    print("Timer fired")
}

// 3秒後
runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
    subscription.cancel()
}
