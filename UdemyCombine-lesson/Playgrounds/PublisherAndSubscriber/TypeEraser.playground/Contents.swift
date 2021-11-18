import UIKit
import Combine

//  PassthroughSubject<Int, Never>()でできているという情報が見れる
//let publisher = PassthroughSubject<Int, Never>()

// AnyPublisherという型に秘匿される
let publisher = PassthroughSubject<Int, Never>().eraseToAnyPublisher()

// 使う側が好きなように変換できる？？
