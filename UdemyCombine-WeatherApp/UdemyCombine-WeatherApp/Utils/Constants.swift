//
//  Constants.swift
//  UdemyCombine-WeatherApp
//
//  Created by kazunori.aoki on 2021/11/18.
//

import Foundation

struct Constants {

    struct URLs {
        static func weather(city: String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=90e47b66a3c6dbc298d981cff42ce04b&units=imperial"
        }
//        static let weather = "https://api.openweathermap.org/data/2.5/weather?q=Houston&appid=90e47b66a3c6dbc298d981cff42ce04b&units=imperial"
    }
}
