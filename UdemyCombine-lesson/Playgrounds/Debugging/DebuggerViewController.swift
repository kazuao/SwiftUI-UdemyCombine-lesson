//
//  DebuggerViewController.swift
//  UdemyCombine-lesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import UIKit
import Combine

class DebuggerViewController: UIViewController {

    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        let publisher = (1...10).publisher

        cancellable = publisher
            .breakpoint(receiveOutput: { value in
                return value > 9 // 10になったら、breakpointで止まる
            })
            .sink {
                print($0)
            }
    }
}
