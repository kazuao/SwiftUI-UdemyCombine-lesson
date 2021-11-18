//
//  WebService.swift
//  UdemyCombine-lesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import Foundation
import Combine

class WebService {
    func getPosts() -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main) // メインスレッドで実行
            .eraseToAnyPublisher()
    }
}
