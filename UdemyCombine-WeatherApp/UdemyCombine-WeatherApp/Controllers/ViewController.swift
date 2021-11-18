//
//  ViewController.swift
//  UdemyCombine-WeatherApp
//
//  Created by kazunori.aoki on 2021/11/18.
//

import UIKit
import Combine

class ViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var textField: UITextField!


    // MARK: Property
    private let webService = WebService()


    // MARK: Variable
    private var cancellable: AnyCancellable?


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPublishers()

//        cancellable = webService.fetchWeather(city: "Houston")
//            .catch { _ in Just(Weather.placeholder) }
//            .map { weather in
//                if let temp = weather.temp {
//                    return "\(temp)F"
//                } else {
//                    return "Error getting weather!"
//                }
//            }
//            .assign(to: \.text, on: temperatureLabel)
    }
}


// MARK: - Setup
private extension ViewController {

    func setupPublishers() {
        let publisher = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: textField)

        cancellable = publisher
            .compactMap {
                // objectは↑のobject
                ($0.object as! UITextField).text?
                    .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webService.fetchWeather(city: city)
                    .catch { _ in Just(Weather.placeholder) }
                    .map { $0 }
            } 
            .sink {
                if let temp = $0.temp {
                    self.temperatureLabel.text = "\(temp)"
                } else {
                    self.temperatureLabel.text = ""
                }
            }
    }
}
