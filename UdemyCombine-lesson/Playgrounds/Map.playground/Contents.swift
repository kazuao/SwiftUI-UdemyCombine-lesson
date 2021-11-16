import UIKit
import Combine

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter
}()

[123, 45, 67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}
.sink {
    print($0)
}
// one hundred twenty-three
// forty-five
// sixty-seven

