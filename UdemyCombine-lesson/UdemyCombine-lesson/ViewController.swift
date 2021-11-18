//
//  ViewController.swift
//  UdemyCombine-lesson
//
//  Created by kazunori.aoki on 2021/11/15.
//

import UIKit
import Combine

class ViewController: UIViewController {

    // MARK: UI
    private let tableView: UITableView = {
        let tableView = UITableView()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()


    // MARK: Property
    private var webService = WebService()
    private var cancellable: AnyCancellable?


    // MARK: Variable
    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        cancellable = webService.getPosts()
            .catch { _ in Just([Post]()) } // エラーをキャッチした場合、から配列を返却
            .assign(to: \.posts, on: self) // どこのプロパティに割り当てるか
    }
}


private extension ViewController {
    func setup() {
        tableView.dataSource = self

        tableView.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]

        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title

        return cell
    }
}
