import UIKit
import Combine

//["A", "B", nil, "C"].publisher
//    .replaceNil(with: "*")
//    .sink { print($0) } // すべてオプショナルになる

["A", "B", nil, "C"].publisher
    .map { $0! } // nilをreplaceしているので、強制アンラップでも問題ない
    .sink { print($0) }
