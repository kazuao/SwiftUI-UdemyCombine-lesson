//
//  Weather.swift
//  UdemyCombine-WeatherApp
//
//  Created by kazunori.aoki on 2021/11/18.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
}

struct Weather: Codable {
    let temp: Double?
    let humidity: Double?

    // 取得できなかった場合のテンプレート？
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
